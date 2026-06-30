/*
delete from lminsuaccrate where riskcode='1303022';
*/

declare
    v_start_date date := date '2015-10-01';
-- 起始日期
    v_end_date date := date '2050-12-01';
-- 结束日期
    v_current_date date;

begin
    v_current_date := v_start_date;
-- 循环直到结束日期
    while v_current_date <= v_end_date loop
        -- 插入数据，每个月的第一天和最后一天
/*
        insert into lminsuaccrate
        (riskcode, insuaccno, baladate, sratedate, aratedate, rateintv, rate, operator, makedate, maketime, ratestate, enddate, fiscalyear, flag, bonustype, startdate, cvalidatefrom, cvalidateto)
        values
        ('1303022', '13030221',
         -- baladate 和 sratedate 为每月第一天
         trunc(v_current_date, 'MM'),
         trunc(v_current_date, 'MM'),
         -- aratedate 为每月最后一天
         last_day(v_current_date),
         'Y', 0.03, '001',
         sysdate, to_char(sysdate, 'HH24:MI:SS'), '1',
         null, 0, null, null, null,
         -- cvalidatefrom 和 cvalidateto 为指定的日期
         date '2023-10-25', date '2099-10-25');
*/
-- 增加一个月
        v_current_date := add_months(v_current_date, 1);
end loop;
end;

/*
select a.* from lminsuaccrate a where riskcode='1303022';
*/;