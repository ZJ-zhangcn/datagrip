--碎片化规则算法配置
select *  from ldcalcheck where fcheckcode = 'FASA0004';
--碎片化（汇流）返回报文及错误信息
select * from lefragmentlogs t where t.fmproposalprtno='5000118359351303';
--问题件提示规则
select * from lcissuepol where contno='5000118287995888';