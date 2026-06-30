# 保险核心业务 SQL 脚本库

## 批量大小写整理

将 SQL 中**单引号字段值之外**的英文字母统一转为小写：

```bash
python3 scripts/lowercase_sql_outside_values.py
```

常用参数：

```bash
# 只检查，不写文件；如果有文件需要转换，退出码为 1
python3 scripts/lowercase_sql_outside_values.py --check

# 查看将产生的 diff，不写文件
python3 scripts/lowercase_sql_outside_values.py --check --diff

# 只处理某个文件或目录
python3 scripts/lowercase_sql_outside_values.py sql/个单.sql
python3 scripts/lowercase_sql_outside_values.py sql
```

脚本规则：

- 保留单引号中的字段值，例如 `'ABC'` 不会变成 `'abc'`
- 单引号外的 SQL 关键字、表名、字段名、别名、注释都会转小写
- 自动保留原文件编码，目前支持 UTF-8 和 GB18030/GBK
- 默认会顺手清理行尾空格；如不需要可加 `--no-trim`
