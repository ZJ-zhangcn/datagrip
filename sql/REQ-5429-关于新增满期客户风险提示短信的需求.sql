SELECT a.*
FROM ldtask a
WHERE taskdescribe = '满期客户风险提示批处理';

SELECT /*insuyearflag, INSUYEAR, */a.*
FROM lcpol a,
     LCINSURED b
WHERE a.contno = b.contno
  and appflag = '1'
  and INSUYEAR between 3 and 10
  and a.GRPCONTNO = '00000000000000000000'
  and a.APPNTNO <> a.INSUREDNO
  and (select count(1) from lcpol where contno = a.contno) = 1
--   and (APPNTNAME like '个险投保%' or APPNTNAME like '银保投保%')
  and get_age(b.BIRTHDAY, a.enddate) > 18
order by CVALIDATE;

SELECT a.CONTNO                                                    保单号,
       c.CUSTOMERNO                                                客户号,
       (SELECT name FROM ldperson WHERE CUSTOMERNO = c.CUSTOMERNO) name,
       a.INSUYEAR                                                  保险期间,
       a.CVALIDATE                                                 生效日期,
       a.ENDDATE                                                   满期日期,
       get_age(b.BIRTHDAY, a.ENDDATE)                              满期时被保人年龄,
       a.ENDDATE - 31,
       a.ENDDATE - 30,
       a.ENDDATE - 29,
       c.MOBILE                                                    手机号
FROM lcpol a,
     LCINSURED b,
     lcaddress c
WHERE a.CONTNO = b.CONTNO
  AND b.ADDRESSNO = c.ADDRESSNO
  AND (b.APPNTNO = c.CUSTOMERNO OR b.INSUREDNO = c.CUSTOMERNO)
  AND a.CONTNO = '2024120500002926';


/*
update lcaddress
set mobile = '17708075004'
where CUSTOMERNO in ('1000006026', '');
*/


SELECT a.*
FROM SMS_DISPATCH_LIST a
WHERE SENDTARGET in ('17708075001', '17708079999');

/*
DELETE
FROM SMS_DISPATCH_LIST
WHERE SENDTARGET in ('17708075001', '17708079999')
  and SERVICEID = 'Ms1005';
*/

select distinct contno
from lcpol a
where grpcontno = '00000000000000000000'
  and enddate = date'2018-10-20'
  and appflag = '1'/*
  and (select case insuyearflag
                  when 'A' then insuyear
                  when 'Y' then insuyear
                  when 'D' then insuyear / 365
                  when 'M' then insuyear / 12 end
       from lcpol
       where polno = a.polno) > 1*/
  and contno = '2018071900004916'