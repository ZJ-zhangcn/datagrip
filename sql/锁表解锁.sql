--查看数据库引起锁表的sql语句
select a.username,
       a.machine,
       a.program,
       a.sid,
       a.serial#,
       a.status,
       c.piece,
       c.sql_text
  from v$session a, v$sqltext c
 where a.sid in (select distinct t2.sid
                   from v$locked_object t1, v$session t2
                  where t1.session_id = t2.sid)
   and a.sql_address = c.address(+)
 order by c.piece;

--以下几个为相关表
select * from v$lock;

select * from v$sqlarea;

select * from v$session;

select * from v$process;

select * from v$locked_object;

select * from all_objects;

select * from v$session_wait;

--查看被锁表信息
select sess.sid,
       sess.serial#,
       lo.oracle_username,
       lo.os_user_name,
       ao.object_name,
       lo.locked_mode
  from v$locked_object lo, dba_objects ao, v$session sess
 where ao.object_id = lo.object_id
   and lo.session_id = sess.sid;

--解锁
----分别为sid和serial#号
/*
alter system kill session '3446,8726';

alter system kill session '2567,2750';

alter system kill session '2289,2309';

alter system kill session '869,11100';
*/;