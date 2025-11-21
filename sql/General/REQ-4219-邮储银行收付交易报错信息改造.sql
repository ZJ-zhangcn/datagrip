SELECT * FROM ldcode1 WHERE codetype = 'bankerror' AND  code = '0120' and codename='账号不存在'

select a.* from lyreturnfrombankb a where polno='2024072900000276'

select a.* from loprtmanager a where otherno='2024072900000276'

select PRTNOTESTATE,a.* from ljspay a where otherno='2024072900000276'



select a.serialno from lysendtobank a where a.paycode = '86310020240310002307'
select a.serialno,a.paycode from lysendtobank a where  get_SFPrtNo(a.polno, a.notype)='5000118240726019'  and a.accname = '银保投保二十'  and a.accno = '123'  and a.paymoney = 10000.0 and a.dealtype = 'S'
select * from LYSendToBank where SerialNo = '20240729_28182' and PayCode = '86310020240310002307'
select * from LYBankLog where SerialNo = '20240729_28182';