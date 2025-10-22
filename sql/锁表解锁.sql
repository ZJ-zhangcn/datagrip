--查看数据库引起锁表的SQL语句
SELECT A.USERNAME,
       A.MACHINE,
       A.PROGRAM,
       A.SID,
       A.SERIAL#,
       A.STATUS,
       C.PIECE,
       C.SQL_TEXT
  FROM V$SESSION A, V$SQLTEXT C
 WHERE A.SID IN (SELECT DISTINCT T2.SID
                   FROM V$LOCKED_OBJECT T1, V$SESSION T2
                  WHERE T1.SESSION_ID = T2.SID)
   AND A.SQL_ADDRESS = C.ADDRESS(+)
 ORDER BY C.PIECE;
--以下几个为相关表
SELECT * FROM v$lock;
SELECT * FROM v$sqlarea;
SELECT * FROM v$session;
SELECT * FROM v$process;
SELECT * FROM v$locked_object;
SELECT * FROM all_objects;
SELECT * FROM v$session_wait;
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
----分别为SID和SERIAL#号
/*
alter system kill session '869,11100';
alter system kill session '371,1169';
alter system kill session '869,11100';
alter system kill session '869,11100';
*/;