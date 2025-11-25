select a.*
from ybtreservcont a
where STANDBYFLAG1 = '2025111300000206';
--ssh
select s.sysvarvalue
from ldsysvar s
where s.sysvar = 'SFTPServer-ShareImage';
--10.52.200.101#22#weblogic#weblogic2020%
--核心影像路径
select *
from ldsysvar s
where s.sysvar = 'SFTPServer-OriginalImage';--/data/Image/psbc/RECV
--批处理
select a.* from ldtask a where TASKDESCRIBE like '%上行预约单承保短信%';

select uwflag from lccont a where contno='2025111300000206';

