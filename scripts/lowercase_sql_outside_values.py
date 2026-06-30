#!/usr/bin/env python3
"""Lowercase SQL text outside single-quoted field values.

Default target is ./sql when executed from the repository root.
The script preserves each file's original encoding: UTF-8 or GB18030/GBK.

Examples:
  python3 scripts/lowercase_sql_outside_values.py
  python3 scripts/lowercase_sql_outside_values.py --check
  python3 scripts/lowercase_sql_outside_values.py sql/个单.sql
"""

from __future__ import annotations

import argparse
import difflib
import sys
from pathlib import Path

SUPPORTED_ENCODINGS = ("utf-8", "gb18030")


def detect_encoding(data: bytes) -> str:
    """Return the first supported encoding that can decode data."""
    for encoding in SUPPORTED_ENCODINGS:
        try:
            data.decode(encoding)
            return encoding
        except UnicodeDecodeError:
            continue
    raise UnicodeDecodeError(
        "sql-encoding",
        data,
        0,
        min(len(data), 32),
        "file is neither UTF-8 nor GB18030",
    )


def lowercase_outside_single_quoted_values(text: str) -> str:
    """Lowercase every character outside SQL single-quoted string literals.

    SQL string escaping by doubled single quotes is preserved, e.g.:
      'ABC''DEF' stays 'ABC''DEF'

    Everything outside string literals is lowercased, including SQL keywords,
    table names, aliases, comments, and block-commented SQL.
    """
    output: list[str] = []
    in_string = False
    i = 0

    while i < len(text):
        ch = text[i]

        if in_string:
            output.append(ch)
            if ch == "'":
                if i + 1 < len(text) and text[i + 1] == "'":
                    output.append(text[i + 1])
                    i += 2
                    continue
                in_string = False
            i += 1
            continue

        if ch == "'":
            in_string = True
            output.append(ch)
            i += 1
            continue

        output.append(ch.lower())
        i += 1

    return "".join(output)


def iter_sql_files(targets: list[Path]) -> list[Path]:
    files: list[Path] = []
    for target in targets:
        if target.is_dir():
            files.extend(sorted(target.rglob("*.sql")))
        elif target.is_file() and target.suffix.lower() == ".sql":
            files.append(target)
        elif target.exists():
            print(f"skip non-sql target: {target}", file=sys.stderr)
        else:
            raise FileNotFoundError(target)
    return sorted(dict.fromkeys(files))


def trim_trailing_whitespace(text: str) -> str:
    lines = text.splitlines(keepends=True)
    cleaned: list[str] = []
    for line in lines:
        if line.endswith("\r\n"):
            body, newline = line[:-2], "\r\n"
        elif line.endswith("\n"):
            body, newline = line[:-1], "\n"
        else:
            body, newline = line, ""
        cleaned.append(body.rstrip(" \t") + newline)
    return "".join(cleaned)


def process_file(path: Path, *, write: bool, show_diff: bool, trim: bool) -> bool:
    original_bytes = path.read_bytes()
    encoding = detect_encoding(original_bytes)
    original = original_bytes.decode(encoding)

    converted = lowercase_outside_single_quoted_values(original)
    if trim:
        converted = trim_trailing_whitespace(converted)

    if converted == original:
        return False

    if show_diff:
        diff = difflib.unified_diff(
            original.splitlines(keepends=True),
            converted.splitlines(keepends=True),
            fromfile=str(path),
            tofile=str(path),
        )
        sys.stdout.writelines(diff)

    if write:
        path.write_bytes(converted.encode(encoding))

    print(f"changed: {path} ({encoding})")
    return True


def main(argv: list[str] | None = None) -> int:
    parser = argparse.ArgumentParser(
        description="Lowercase SQL outside single-quoted values while preserving file encoding."
    )
    parser.add_argument(
        "targets",
        nargs="*",
        type=Path,
        default=[Path("sql")],
        help="SQL file or directory targets. Default: sql",
    )
    parser.add_argument(
        "--check",
        action="store_true",
        help="Do not write files; exit 1 if any file would change.",
    )
    parser.add_argument(
        "--diff",
        action="store_true",
        help="Print unified diffs for files that would change.",
    )
    parser.add_argument(
        "--no-trim",
        action="store_true",
        help="Do not trim trailing spaces/tabs after conversion.",
    )
    args = parser.parse_args(argv)

    files = iter_sql_files(args.targets)
    changed_count = 0
    for path in files:
        try:
            changed = process_file(
                path,
                write=not args.check,
                show_diff=args.diff,
                trim=not args.no_trim,
            )
        except UnicodeDecodeError as exc:
            print(f"encoding error: {path}: {exc}", file=sys.stderr)
            return 2
        if changed:
            changed_count += 1

    print(f"sql_files_checked: {len(files)}")
    print(f"changed_files: {changed_count}")

    if args.check and changed_count:
        return 1
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
