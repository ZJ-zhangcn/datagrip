/*
update ldcode set code = '300' where codetype = 'ccbcount';
*/
select a.* from ldcode a where codetype = 'ccbcount';

select bankonthewayflag,
       banksuccflag,
       modifydate,
       modifytime,
       to_date((to_char(a.modifydate, 'yyyy-MM-dd') || ' ' || a.modifytime), 'yyyy-MM-dd hh24:mi:ss'),
       a.*
  from ljspay a
 where startpaydate <= date'2025-02-14'
   and startpaydate >= date'1900-01-01'
   and exists(select 1
              from ldcode1 b
              where b.code1 = a.bankcode
                and b.code = '0104'
                and b.codetype = 'unionAndSinglebank'
                and othersign in ('0', '1'))
   and managecom like '86%'
   and sumduepaymoney > 0
   and (bankonthewayflag = '0' or bankonthewayflag is null)
   and (banksuccflag <> 1 or banksuccflag is null)
   and (prtnotestate = '1' or prtnotestate is null)
   and (bankaccno is not null)
   and (othernotype not in ('2', '3', '10', 'B', '5', '9') or
        (othernotype = '10' and getnoticeno not in (select tempfeeno from ljtempfee) and
         sendbankcount < 7 and exists(select 1
                                      from lpedorapp
                                      where edoracceptno = a.otherno
                                        and othernotype in ('1', '3', '4')) and
         exists(select 1 from lpedorapp where edoracceptno = a.otherno and payform = '4')) or
        (othernotype = '5' and otherno in (select clmno from llbnf where casepaymode = '4') and
         getnoticeno not in (select tempfeeno from ljtempfee) and sendbankcount < 3) or
        (othernotype = '9' and
         not exists (select 1 from lccont where contno = a.otherno and newautosendbankflag = '0')) or
        (othernotype in ('7', '37')) or (othernotype = 'B' and exists (select 1
                                                                       from ljpbalancerela
                                                                       where balancerelano = a.getnoticeno
                                                                         and grpcontno = a.otherno
                                                                         and paymode = '4')))
   --and sendbankcount <= 7
   and not exists (select 1 from lcdelayoverdue where prtno = a.otherno and delaydays = 1)
   and get_sfprtno(a.otherno, a.othernotype) is not null
   and not exists (select '1' from hislcinsuredlist t where t.batchno = a.otherno)
   and not exists (select 1
                   from ljspay
                   where getnoticeno = a.getnoticeno
                     and bankcode = '0104'
                     and othernotype in ('10', '3', '37'))
 order by to_date((to_char(a.modifydate, 'yyyy-MM-dd') || ' ' || a.modifytime), 'yyyy-MM-dd hh24:mi:ss');

select bankonthewayflag,
       banksuccflag,
       prtnotestate,
       sendbankcount,
       modifydate,
       modifytime,
       a.*
  from ljspay a
 where otherno in ('5000112600004665', '5000112600003385', '3600117173618575', '5000112600001740', '3002006231737101',
                   '3600127154966822', '5000118278747184', '3000118820185407', '3600117158997553', '3000117121982994',
                   '3000117185899464', '5000112600003351', '3000115104171003', '3000115104171004', '5000112600003946',
                   '5000112600003724', '5000111000004303', '3600117149825045', '5000111000023095', '5000111000004145')
   and banksuccflag <> '1'
 order by to_date((to_char(a.modifydate, 'yyyy-MM-dd') || ' ' || a.modifytime), 'yyyy-MM-dd hh24:mi:ss');



select * from lybanklog where makedate = date'2025-02-13' and bankcode = '0104';

select a.* from lysendtobank a where senddate = date'2025-02-13' and bankcode = '0104';
--
/*
delete
from lysendlog
where otherno in ('5000112600004665', '5000112600003385', '3600117173618575', '5000112600001740', '3002006231737101',
                  '3600127154966822', '5000118278747184', '3000118820185407', '3600117158997553', '3000117121982994',
                  '3000117185899464', '5000112600003351', '3000115104171003', '3000115104171004', '5000112600003946',
                  '5000112600003724', '5000111000004303', '3600117149825045', '5000111000023095', '5000111000004145');

delete
from lockappgroup
where operatedno in
      ('86010120200310457103', '3000118820185407', '3000117121982994', '3000117185899464', '86310020190310000779',
       '86310020190310000831', '3600127154966822','5000112600001740','3002006231737101','5000111000004145','5000112600003351');

delete from lybanklog where makedate = date'2025-02-13' and bankcode = '0104';

delete from lysendtobank where senddate = date'2025-02-13' and bankcode = '0104';
*/
