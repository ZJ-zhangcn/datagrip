select a.*
from ybtreservcont a
where contno = '2025111800004386';

select a.*
from lccont a
where contno = '2025111800004386';

select a.*
from ljspay a
where otherno in ('2025111900000176', '');

select a.*
from LYSENDTOBANK a
where polno = '2025111900000176';
/*
update ljspay set BANKONTHEWAYFLAG='0' where otherno = '2025111900000176';
delete from LYSENDTOBANK where polno = '2025111900000176';
*/

select a.* from ldtask a where TASKDESCRIBE like '%发盘批处理%';
select a.* from LISDATA.LDTASKPLAN a where TASKCODE='000263';