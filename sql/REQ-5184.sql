-- id: req-5184
-- 标题: 交行预录入开发需求

select a.*
from ybtreservcont a
where contno = '2025121300001156';

select a.*
from lccont a
where contno = '2025121300001156';

select a.*
from ljspay a
where otherno in ('2025111900000176', '');

select a.*
from lysendtobank a
where polno = '2025111900000176';

/*
update ljspay set bankonthewayflag='0' where otherno = '2025111900000176';

delete from lysendtobank where polno = '2025111900000176';
*/

select a.* from ldtask a where taskdescribe like '%发盘批处理%';

select a.* from lisdata.ldtaskplan a where taskcode='000319';

