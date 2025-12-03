SELECT CASE
           WHEN to_date('2026-12-20', 'YYYY-MM-DD') - to_date('2025-10-28', 'YYYY-MM-DD') > 90
               OR 2 = 1 THEN
               CASE
                   WHEN to_date('2028-10-28', 'YYYY-MM-DD') > to_date('2026-12-20', 'YYYY-MM-DD')
                       THEN greatest(28555.18, decode('1', '1', 30762.62, 13494.52))
                   WHEN to_date('2028-10-28', 'YYYY-MM-DD') <= to_date('2026-12-20', 'YYYY-MM-DD') THEN
                       CASE
                           WHEN EXISTS (SELECT 1
                                        FROM lcpol
                                        WHERE polno = '210010000408160'
                                          AND payintv = 0) THEN greatest(greatest((SELECT CASE
                                                                                              WHEN 16 BETWEEN 18 AND 40
                                                                                                  THEN decode('1', '1', 30762.62, 13494.52) * 1.6
                                                                                              WHEN 16 BETWEEN 41 AND 60
                                                                                                  THEN decode('1', '1', 30762.62, 13494.52) * 1.4
                                                                                              WHEN 16 > 60
                                                                                                  THEN decode('1', '1', 30762.62, 13494.52) * 1.2
                                                                                              END
                                                                                   FROM dual), 28555.18),
                                                                         0.0 * power(1 + 0.0175, (SELECT 2 - 1
                                                                                                  FROM dual)))
                           WHEN EXISTS (SELECT 1
                                        FROM lcpol
                                        WHERE polno = '210010000408160'
                                          AND payintv = 12
                                          AND paytodate < payenddate) THEN greatest((SELECT CASE
                                                                                                WHEN 16 BETWEEN 18 AND 40
                                                                                                    THEN decode('1', '1', 30762.62, 13494.52) * 1.6
                                                                                                WHEN 16 BETWEEN 41 AND 60
                                                                                                    THEN decode('1', '1', 30762.62, 13494.52) * 1.4
                                                                                                WHEN 16 > 60
                                                                                                    THEN decode('1', '1', 30762.62, 13494.52) * 1.2
                                                                                                END
                                                                                     FROM dual), 28555.18)
                           WHEN EXISTS (SELECT 1
                                        FROM lcpol
                                        WHERE polno = '210010000408160'
                                          AND payintv = 12
                                          AND paytodate = payenddate) THEN greatest(greatest((SELECT CASE
                                                                                                         WHEN 16 BETWEEN 18 AND 40
                                                                                                             THEN decode('1', '1', 30762.62, 13494.52) * 1.6
                                                                                                         WHEN 16 BETWEEN 41 AND 60
                                                                                                             THEN decode('1', '1', 30762.62, 13494.52) * 1.4
                                                                                                         WHEN 16 > 60
                                                                                                             THEN decode('1', '1', 30762.62, 13494.52) * 1.2
                                                                                                         END
                                                                                              FROM dual), 28555.18),
                                                                                    0.0 *
                                                                                    power(1 + 0.0175, (SELECT 2 - 1
                                                                                                       FROM dual)))
                           END
                   END
           ELSE decode('1', '1', 30762.62, 13494.52)
           END
FROM dual;