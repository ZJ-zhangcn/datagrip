-- id: req-5197
-- 标题: 关于恢复续期转账成功短信中nps问卷链接的申请

select a.* from ljspay a where otherno='2025111000000816';

/*
update ljspay set payform='Y' where otherno='2025111000000816'
*/

--短信
select a.* from sms_dispatch_list a where otherno='2025111000000816';

select a.* from ldcusdinfo a where contno='2025111000000816';