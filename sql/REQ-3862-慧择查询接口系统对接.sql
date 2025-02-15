--04-承保
select signdate,rowid from lccont a where contno='2023112700000796';
--05-回执
select getpoldate,customgetpoldate,rowid from lccont a where contno='2023111300000916';--2023/11/14
--06-回访
select calldate,rowid from lccallresults a where contno='2023112700000796';
--07-保全
select EdorValiDate,rowid from lpedoritem a where contno='2023111300000916';--2024/1/10
--08-续期
select makedate,rowid from ljspay a where otherno='2024060100000726';
select makedate,incometype,rowid from ljapay a where incomeno='2024060100000726';
select ModifyDate,rowid from lyreturnfrombankb a where polno='2024060100000726';--2024/11/14

select * FROM ldsysvar where sysvar = 'HZSftp_login'

select sysvarvalue from ldsysvar where sysvar='BatIPHost' for update;
