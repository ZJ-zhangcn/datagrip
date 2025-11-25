select inbankcode,inbankaccno,a.* from lyrefundlog a where otherno='2024110100000486';

select a.* from ljaget a where otherno='2024110100000486';

select * from ldcode where codetype = 'bank';

select a.* from ldtask a where taskdescribe like '%退票%';

select a.ActuGetNo,
       a.OtherNo,
       b.payinfocode,
       b.payinfo,
       a.PayMode,
       b.reqseqid
  from LJAGet a, ats_transactions b
 where a.actugetno = b.sourcenotecode
   and a.otherno='5000118241104186'
   and a.banksuccflag = '1'
   and a.actugetno = b.sourcenotecode
   and b.transstate = '6'
   and b.reqseqid = (select Max(serialno)
                       from lyreturnfrombankb c
                      where a.otherno = c.polno
                        and a.actugetno = c.paycode)
   and exists (select 1
          from lyreturnfrombankb t
         where a.actugetno = t.paycode
           and a.otherno = t.polno
           and t.banksuccflag = '0000'
           and t.serialno = b.reqseqid)
   and not exists (select 1
          from lyrefundlog c
         where c.standbyflag2 = b.reqseqid
           and c.ActuGetNo = a.ActuGetNo);