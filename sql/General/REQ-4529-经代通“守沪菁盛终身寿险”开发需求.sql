select a.* from tranapp a where prtno='5000112600005001';
insert into tranapp (LOGNO, SOURCE, SUBSOURCE, TRANNO, FUNCFLAG, TRANDATE, TRANTIME, PRTNO, CONTNO, OTHERNO, AGENTCOM, AGENTCODE, STATE, REMARK, USETIME, TIMEINFO, CLIENTIP, SERVERIP, BAK1, BAK2, BAK3, MAKEDATE, MAKETIME, MODIFYDATE, MODIFYTIME)
values (136120, '218FF111FCF0AFB5E47FC6C8EE9AE508', '05', null, 'JDT001', to_date('19-11-2024', 'dd-mm-yyyy'), '15:17:31', '5000112600018707', '5000112600018707', null, 'JK00011300', 'JD000004', '1', '交易成功', 31.37, '0.231,0.131,0.228,0.327,28.764,1.607,0.082', null, '10.52.200.101', 'undefined', null, null, to_date('19-11-2024', 'dd-mm-yyyy'), '15:17:33', to_date('19-11-2024', 'dd-mm-yyyy'), '15:18:05');
select agentcode,a.* from lccont a where contno='5000112600018707'

select a.* from laagent a where agentcode='JD000004'

select a.* from loprtmanager a where otherno='5000112600018707'

select a.* from es_doc_main a where docid='3613315100004459'

select a.* from ldtask a where taskclass='NewContDDUploadImageTask'

select a.* from lcinsured a where contno='5000112600005001'

SELECT nvl(healthyamnt6( '1001735632' ,'G1','3'),0) from dual where 1=1;