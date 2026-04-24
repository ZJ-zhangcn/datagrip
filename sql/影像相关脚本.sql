--前置机放置影像的服务器账户密码，不能为本地
select sysvarvalue from ldsysvar where sysvar = 'SFTPServer-ShareImage';
--前置机放置影像的服务器位置
select s.sysvarvalue
from ldsysvar s
where s.sysvar = 'SFTPServer-OriginalImage';
--核心备份影像的位置，为本地
select s.sysvarvalue
from ldsysvar s
where s.sysvar = 'SFTPServer-BackupsImage';
--核心组装影像的位置，为本地
select s.sysvarvalue
from ldsysvar s
where s.sysvar = 'SFTPServer-LocalImage';
--核心组装报文的位置，为本地
SELECT a.sysvarvalue
FROM ldsysvar a
where a.sysvar = 'SFTPServer-XMLImage';
--核心组装压缩包的位置，为本地
SELECT a.sysvarvalue
FROM ldsysvar a
where a.sysvar = 'SFTPServer-CompressImage';
--信雅达地址
SELECT SYSVARVALUE
FROM LDSYSVAR
WHERE SYSVAR = 'Server-SunECM';
