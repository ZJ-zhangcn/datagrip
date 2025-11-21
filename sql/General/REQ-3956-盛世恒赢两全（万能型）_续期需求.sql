/*
5000118240423010  2024022800004026
5000118240423027  2024042300000186
5000118240424016  2024042400000286  女
5000118240424023  2024042400000376  非同一人
5000118240510010  2024051000000206
5000118240511016  2024080100000286  节假日拆单
*/


--
select cvalidate,paytodate,a.* from lcpol a where prtno='5000118240710021';
select appflag,cvalidate,paytodate,a.* from lcpol a where contno='2024071000000716';

--
select appflag,a.* from lccont a where contno='2024071000000716';

--
select a.* from lccontstate a where contno='2024032500000126';

--hanuptype:1-新契约 2-保全 3-续期 4-理赔 5-渠道  flag:0-未挂起  1-已挂起
select a.* from lcconthangupstate a where contno='2024061800000266';

--
select a.* from ljspay a where otherno='2024071000000806';
select a.* from ljspayperson a where contno='2023062600001086';
select a.* from ljapay a where incomeno='2024061800000266';
select a.* from ljapayperson a where contno='2024061800000266';
select a.* from ljtempfee a where otherno='2024061800000266';
select a.* from ljtempfeeclass a where TEMPFEENO='7402121100347444';

--
select a.* from lpedoritem a where contno='2024022800004026';

--
select a.* from loprtmanager a where otherno='2024032500000126';

--
select idstdate,idexpdate,a.* from lcappnt a where contno='2023010100004886';
select idstdate,idexpdate,a.* from lcinsured a where contno='2024042300000186';

--
select a.* from lcaddress a where customerno='1060094698';--
/*
update lcaddress set email='zhangjin05@sinosoft.com.cn1' where customerno!='1060093065' and email='zhangjin05@sinosoft.com.cn'
*/

--
select a.* from ljaget a where otherno='2024051000000206';
select a.* from ljagettempfee a where actugetno='86000020250370015030';

/*
暂交退费后数据处理；
       ljaget和ljagettempfee表生成数据
       ljtempfee表ConfFlag置为1，ConfDate为当前日期
*/
select a.* from ljaget a where otherno='2024042400000376';
select a.* from ljagettempfee a where ACTUGETNO in (select ACTUGETNO from ljaget where otherno='2024042400000376' and makedate=date'2026-06-26');
--ljtempfee表ConfFlag置为1，ConfDate为当前日期
select a.* from ljtempfee a where otherno='2024042400000376' and paydate between date'2026-06-24' and date'2026-06-26';

--
select a.* from lysendtobank a where polno='2024022800004026';
select a.* from lybanklog a where a.SERIALNO='20250228_27554';
select banksuccflag,a.* from lyreturnfrombankb a where polno in ('2024022800004026','');
select a.* from lyreturnfrombankb a where paycode='86310020250310000292';

--
select a.* from SMS_DISPATCH_LIST a where otherno='2024032500000126';
select a.* from SMS_DISPATCH_LIST a where SENDTARGET='17504240001';

--
select a.* from ldtask a where taskdescribe like '%打印%';

--
select a.* from lcinsureacctrace a where contno='2024061800000266' and paydate between date'2026-06-19' and date'2026-06-20' order by paydate desc;
update lcinsureacctrace set makedate=paydate,modifydate=paydate where contno='2024061800000266';

select sysvarvalue from ldsysvar where sysvar = 'XQDelayedCrossing';

SELECT SYSVARVALUE FROM LDSYSVAR WHERE SYSVAR = 'BX-SFTP';