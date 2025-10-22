--04-承保
select signdate from lccont a where contno='2023112700000796';
--05-回执
select getpoldate,customgetpoldate from lccont a where contno='2023111300000916';
--2023/11/14
--06-回访
select calldate from lccallresults a where contno='2023112700000796';
--07-保全
select EdorValiDate from lpedoritem a where contno='2023111300000916';
--2024/1/10
--08-续期
select makedate from ljspay a where otherno='2024060100000726';
select makedate,incometype from ljapay a where incomeno='2024060100000726';
select ModifyDate from lyreturnfrombankb a where polno='2024060100000726';
--2024/11/14

select * FROM ldsysvar where sysvar = 'HZSftp_login';

select sysvarvalue from ldsysvar where sysvar='BatIPHost';