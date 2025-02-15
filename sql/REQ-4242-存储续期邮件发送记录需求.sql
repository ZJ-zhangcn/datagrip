select a.*,rowid from XQEmailSendLogs a order by serialno desc;
select a.*,rowid from XQEmailSendLogs a where contno='2024082000000176'
--select a.*,rowid from xqsaveemlsendinfo a ;
select a.*,rowid from Xqletterstopapply a where contno='2024071000000806';


insert into Xqletterstopapply (SERIALNO, BATCHNO, CONTNO, LETTERTYPE, STOPSTATE, STOPAPPLYDATE, STOPSTARTDATE, STOPENDDATE, STOPOPERATOR, STOPMAKEDATE, STOPMAKETIME, STOPREMARK, STOPFILEURL, STOPLETTERURL, RENEWOPERATOR, RENEWMAKEDATE, RENEWMAKETIME, RENEWREMARK, RENEWFILEURL, RENEWLETTERURL, PAYTODATE, PAYTOMONEY, PAYTOCOUNT, PAYTOYEAR, MANAGECOM, OPERATOR, MAKEDATE, MAKETIME, MODIFYDATE, MODIFYTIME, STANDBYFLAG1, STANDBYFLAG2, STANDBYFLAG3, STANDBYFLAG4, STANDBYFLAG5, STANDBYFLAG6)
values ('980Le0000003025', '00000000', '2023010100004756', '42', '01', to_date('09-09-2023', 'dd-mm-yyyy'), to_date('09-09-2023', 'dd-mm-yyyy'), to_date('31-12-9999', 'dd-mm-yyyy'), 'lis-001', to_date('09-09-2024', 'dd-mm-yyyy'), '00:20:42', '1', null, 'xerox/XQNoteFile/StopFile/2024-09-09/2024-09-09_2023010100004756_0000003024.pdf', null, null, null, null, null, null, to_date('02-01-2024', 'dd-mm-yyyy'), 10000.00, '2', '2', '86', '001', to_date('09-09-2024', 'dd-mm-yyyy'), '00:20:42', to_date('09-09-2024', 'dd-mm-yyyy'), '00:20:42', '01', '02', null, null, null, null);


--²¹¼Ä¼ÇÂ¼
select a.*,rowid from LLettersReissue a where contno ='2024071000000806';

select a.*,rowid from ldtask a where taskclass='EMailSendRenewApplyDateTask'

SELECT 1 FROM Xqletterstopapply WHERE standbyflag1 ='01' and stopstate ='01' and standbyflag2 = '02' and contno ='2024090200000406'
select a.*,rowid from loprtmanager a where otherno ='2023010100004756';
select a.*,rowid from ljspay a where otherno='2023010100004886';
select a.*,rowid from ljspayperson a where contno='2024090200000406';
select email,a.*,rowid from lcaddress a where customerno in (select appntno from lcappnt where contno='2024082000000176')--zhangjin05@sinosoft.com.cn

update lcaddress set email=null where email='zhangjin05@sinosoft.com.cn'

select signdate,cvalidate,paytodate,payenddate,a.*,rowid from lcpol a where contno='2024082000000176'
select a.*,rowid from ldtask a where taskdescribe like '%ÓÊ¼þ%' 
select a.*,rowid from ldworkcalendar a where datetype = 'N' and caldate = date '2025-08-11'
