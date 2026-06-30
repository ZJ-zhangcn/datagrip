-- id: req-4219
-- 标题: 邮储银行收付交易报错信息改造

select * from ldcode1 where codetype = 'bankerror' and  code = '0120' and codename='账号不存在'

select a.* from lyreturnfrombankb a where polno='2024072900000276'

select a.* from loprtmanager a where otherno='2024072900000276'

select prtnotestate,a.* from ljspay a where otherno='2024072900000276'



select a.serialno from lysendtobank a where a.paycode = '86310020240310002307'

select a.serialno,a.paycode from lysendtobank a where  get_sfprtno(a.polno, a.notype)='5000118240726019'  and a.accname = '银保投保二十'  and a.accno = '123'  and a.paymoney = 10000.0 and a.dealtype = 'S'

select * from lysendtobank where serialno = '20240729_28182' and paycode = '86310020240310002307'

select * from lybanklog where serialno = '20240729_28182';