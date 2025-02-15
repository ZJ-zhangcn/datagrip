select a.*,rowid from lcpol a where grpcontno='2024013000000956'

select standbyflag3,a.*,rowid from LpBalanceDefTrace a where standbyflag3='5005190138550004'

select a.*,rowid from LjpBalance a where grpcontno='2024013000000956'

select paysubject,a.*,rowid from lcgrpcont a where grpcontno = '2021012600004586'

select bqappno 保全申请书号,
       edorstate,
       (select codename
          from ldcode
         where codetype = 'edorstate'
           and code = a.edorstate) 保全状态,
       a.*,
       rowid
  from lpedorapp a
 where bqappno = '5005190124031501'

select a.*,rowid from ldcode a where codetype like '%edorstate%' 

select a.*,rowid from ldtask a where taskdescribe like '%满期%' 

select a.*,rowid from es_doc_main a where doccode in ('5005190140201018','')

insert into es_doc_main (DOCID, DOCCODE, BUSSTYPE, SUBTYPE, NUMPAGES, DOCFLAG, DOCREMARK, SCANOPERATOR, MANAGECOM, INPUTSTATE, OPERATOR, INPUTSTARTDATE, INPUTSTARTTIME, INPUTENDDATE, INPUTENDTIME, MAKEDATE, MAKETIME, MODIFYDATE, MODIFYTIME, VERSION, SCANNO, PRINTCODE, PKGCODE, SUBTYPESUNCAN, SCANFLAG)
values (1982763601, '5005190140620018', 'BQ', '50051901', 1, '1', null, '002', '86010101', null, null, null, null, null, null, to_date('01-02-2024', 'dd-mm-yyyy'), '11:57:53', to_date('01-02-2024', 'dd-mm-yyyy'), '11:57:53', '1', 'BQ2024860100001X', '5005190140201018', 74, 'TXBQ', null);

select sysvarvalue from ldsysvar where sysvar='BatIPHost' for update;

select otherno
  from lpedorapp a
 where '1706687479000' = '1706687479000'
   and othernotype = '4'
   and bqappno = '5005190140201025'
   and otherno <> '2024013000000957'
   and (edorstate <> '7' or exists
        (select 1 from ljpbalance where grpcontno = a.otherno))


select a.*,rowid from ljpbalance a where grpcontno='2024013000000956'

select a.*,rowid from ldcode a where codename like '%撤销%' 

select a.* from es_doc_main a where doccode='5005190140228018'

insert into es_doc_main (DOCID, DOCCODE, BUSSTYPE, SUBTYPE, NUMPAGES, DOCFLAG, DOCREMARK, SCANOPERATOR, MANAGECOM, INPUTSTATE, OPERATOR, INPUTSTARTDATE, INPUTSTARTTIME, INPUTENDDATE, INPUTENDTIME, MAKEDATE, MAKETIME, MODIFYDATE, MODIFYTIME, VERSION, SCANNO, PRINTCODE, PKGCODE, SUBTYPESUNCAN, SCANFLAG)
values (19828135, '5005190140228018', 'BQ', '50051901', 1, '1', null, '002', '86010101', null, null, null, null, null, null, to_date('28-02-2024', 'dd-mm-yyyy'), '11:39:39', to_date('28-02-2024', 'dd-mm-yyyy'), '11:39:39', '1', 'BQ2024860100001X', '5005190140228018', 85, 'TXBQ', null);

