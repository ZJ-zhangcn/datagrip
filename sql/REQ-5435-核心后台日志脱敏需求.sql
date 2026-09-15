SELECT a.APPNTNAME,
       c.NEWBANKACCNO,
       a.IDNO,
       b.MOBILE,
       b.PHONE,
       b.EMAIL,
       b.POSTALADDRESS
FROM lcappnt a,
     lcaddress b,
     lccont c
WHERE a.appntno = b.customerno
  and a.addressno = b.addressno
  and a.contno = c.contno
  and a.contno = '2026082400000226';

/*
update lcaddress
set phone='021-87654321-01',
    email='zhangjin05@sinosoft.com.cn'
where customerno = '1060103181';
*/

z********5@sinosoft.com.cn
021**********01


SELECT a.*
FROM sms_dispatch_list a
WHERE otherno like '2%'
  and SMSCONTENT like '%保费%'
  and SMSCONTENT not like '%终止合同申请已成功%'
  and SMSCONTENT not like '%部分提取已交易成功%'
  and SMSCONTENT not like '%已逾期终止%'
  and SMSCONTENT not like '%有贷款未清偿%'
  and SMSCONTENT not like '%生存给付金额为%';

SELECT a.* FROM ldtask a WHERE TASKDESCRIBE like '%短信%';

select *
from sms_dispatch_list a
where /*sysdate > a.sendtime
  and */otherno = '7402121900000003'
  and a.state = '0'
  and not exists (select 1
                  from ldcode b
                  where a.serviceid = b.code
                    and b.codetype = 'PauseSendSMS')
order by a.makedate asc, a.maketime asc;

select *
from ldcode b
where /*b.code in ('2001', '2002', '2003')
  and*/ b.codetype = 'PauseSendSMS';