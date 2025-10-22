--drop table cux_in_interface_temp;
create table cux_in_interface_temp as
select distinct a.source_batch_id ,
       accounting_date,
       line_description,
       a.je_category_name,
       ledger_flag,
       segment1,
       segment3,
       currency_code,
       doc_seq_num
  from cux_gl_interface a
 where ledger_flag='N'
 --  and source_batch_id = '00000000000000007597'
   and segment3 in ('10020101');
select a.* from cux_in_interface_temp a

--drop table of_interface_temp;
create table of_interface_temp as
select distinct f.source_batch_id,
                f.accounting_date,
                f.je_category_name,
                f.source_desc,
                f.segment1,
                f.segment3,
                f.currency_code,
                f.lis_prtno,
                f.lis_contno,
                f.lis_edoracceptno,
                f.lis_caseno,
                f.header_id,
                f.header_desc,
                p.doc_seq_num,
                '0000000000000000' paycode,
                '0000000000000000' otherno
from of_interface f,
     cux_in_interface_temp p
where f.source_batch_id = p.source_batch_id
  and f.accounting_date = p.accounting_date
  and f.source_desc = p.je_category_name
  and f.segment1 = p.segment1
  --and f.source_batch_id='00000000000000007597'
  and f.segment3 in ('10020101')
  and f.attribute15 = 'N'
--and f.accounting_date between date'2022-01-01' and date'2025-01-31';
alter table of_interface_temp modify paycode VARCHAR2(100);
select DOC_SEQ_NUM,paycode,a.* from of_interface_temp a where paycode in ('86000020260370000918','86010120270320000294','86010120250320003929','86000020260370000918','86010120250320003936','86010120250320003918','86010120250320003919','86310020250320000285','86010120250320003927','86010120250320003928','86010120280320000227','86010120250320003938','86010120250320003939','86010120250320003913','86010120250320003920','86000020260370000920','86010120250320003916','86010120250320003917','86000020250370015332','86000020260370000922','86000020270370000729','86010120250320003935','86310020250320000284','86000020260370000924','86010120250320003933')


--契约首期
 update of_interface_temp p
    set p.paycode =
        (select a.payno
           from ljapay a, lccont t
          where a.incomeno = t.contno
            and t.prtno = p.header_id
            and a.incometype = '2' )
  where exists (select a.payno
           from ljapay a, lccont t
          where a.incomeno = t.contno
            and t.prtno = p.header_id
            and a.incometype = '2');
--团险契约首期
 update of_interface_temp p
    set p.paycode =
        (select a.payno
           from ljapay a, lcgrpcont t
          where a.incomeno = t.grpcontno
            and t.prtno = p.header_id
            and a.incometype = '1' )
  where exists (select a.payno
           from ljapay a, lcgrpcont t
          where a.incomeno = t.grpcontno
            and t.prtno = p.header_id
            and a.incometype = '1');
--付费数据 修改实付号
update of_interface_temp p set p.paycode = (
 select a.actugetno
 from ljaget a,lccont t
 where a.otherno=t.contno
 and t.prtno=p.header_id
 --and t.contno='2016010400052388'
 and a.confdate > add_months(p.accounting_date,-1)
 and a.confdate <= p.accounting_date and rownum=1)
 where exists
 (select a.actugetno
 from ljaget a,lccont t
 where a.otherno=t.contno
 and t.prtno=p.header_id
 --and t.contno='2016010400052388'
 and a.confdate > add_months(p.accounting_date,-1)
 and a.confdate <= p.accounting_date);
--付费数据 修改实付号
update of_interface_temp p set p.paycode = (
 select a.actugetno
 from ljaget a,lccont t
 where a.otherno=t.contno
 and t.contno=p.header_id
 and a.confdate > add_months(p.accounting_date,-1)
 and a.confdate <= p.accounting_date and rownum=1)
 where exists
 (select a.actugetno
 from ljaget a,lccont t
 where a.otherno=t.contno
 and t.contno=p.header_id
 and a.confdate > add_months(p.accounting_date,-1)
 and a.confdate <= p.accounting_date);
--个险保全数据更新
 update of_interface_temp p
    set p.paycode =
        (select a.payno
           from ljapay a
          where a.incomeno = p.header_id
            and a.incometype = '10' )
  where exists (select a.payno
           from ljapay a
          where a.incomeno = p.header_id
            and a.incometype = '10' );
--个险保全数据更新
 update of_interface_temp p
    set p.paycode =
        (select a.actugetno
           from ljaget a
          where a.otherno = p.header_id
            and a.othernotype in( '10','3','5') and rownum=1 )
  where exists (select a.actugetno
           from ljaget a
          where a.otherno = p.header_id
            and a.othernotype in( '10','3','5') );
--团险定期结算数据
update of_interface_temp p
    set p.paycode =
        (select a.payno
           from ljapay a ,LjpBalanceRela t
          where a.payno=t.actugetno
           and t.balancerelano = p.header_id
           and a.incometype = 'B' and rownum=1  )
  where exists (select a.payno
           from ljapay a ,LjpBalanceRela t
          where a.payno=t.actugetno
           and t.balancerelano = p.header_id
           and a.incometype = 'B' );
PayType=certifrela
select GLVOUCHERNO,RDSEQ,reqseqid,ACTTYPE,a.* from LYATSTRANRELA a where ACTTYPE='S3' and exists (select VOUCHERCODE from S3_RTRECMENTS where urid=a.REQSEQID)
update LYATSTRANRELA set GLVOUCHERNO=null where
PayType=certif_ats
select GLVOUCHERNO,a.* from ats_transactions a where rdseq in (select RDSEQ from LYATSTRANRELA)
PayType=certif_ats_sup
select GLVOUCHERNO,a.* from ats_transactions_supplemented a where rdseq in (select RDSEQ from LYATSTRANRELA) and GLVOUCHERNO is not null
update ats_transactions_supplemented set GLVOUCHERNO=null
PayType=certif_S3
select VOUCHERCODE,a.* from S3_RTRECMENTS a where urid in (select reqseqid from LYATSTRANRELA)

select GLVOUCHERNO,a.* from LYATSTRANRELA a where exists (select VOUCHERCODE from S3_RTRECMENTS where urid=a.REQSEQID)
select a.* from cux_gl_interface a where
select a.* from of_interface a where


update S3_RTRECMENTS a set a.VOUCHERCODE=(select p.glvoucherno from lyatstranrela p where p.reqseqid=a.urid and p.acttype='S3' and rownum=1 )
 where exists (select p.glvoucherno from lyatstranrela p where p.reqseqid=a.urid and p.acttype='S3');