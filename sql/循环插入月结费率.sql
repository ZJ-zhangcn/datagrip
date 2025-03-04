DECLARE
    v_start_date DATE := DATE '2015-10-01'; -- 起始日期
    v_end_date DATE := DATE '2076-02-01'; -- 结束日期
    v_current_date DATE;
BEGIN
    v_current_date := v_start_date;

    -- 循环直到结束日期
    WHILE v_current_date <= v_end_date LOOP
        -- 插入数据，每个月的第一天和最后一天
        INSERT INTO LMINSUACCRATE
        (RISKCODE, INSUACCNO, BALADATE, SRATEDATE, ARATEDATE, RATEINTV, RATE, OPERATOR, MAKEDATE, MAKETIME, RATESTATE, ENDDATE, FISCALYEAR, FLAG, BONUSTYPE, STARTDATE, CVALIDATEFROM, CVALIDATETO)
        VALUES
        ('1311004', '13110041',
         -- BALADATE 和 SRATEDATE 为每月第一天
         TRUNC(v_current_date, 'MM'),
         TRUNC(v_current_date, 'MM'),
         -- ARATEDATE 为每月最后一天
         LAST_DAY(v_current_date),
         'Y', 0.03, '001',
         SYSDATE, TO_CHAR(SYSDATE, 'HH24:MI:SS'), '1',
         NULL, 0, NULL, NULL, NULL,
         -- CVALIDATEFROM 和 CVALIDATETO 为指定的日期
         DATE '2023-10-25', DATE '2099-10-25');

        -- 增加一个月
        v_current_date := ADD_MONTHS(v_current_date, 1);
    END LOOP;
END;

select a.* from LMINSUACCRATE a where RISKCODE='1311004' and INSUACCNO='13110041'