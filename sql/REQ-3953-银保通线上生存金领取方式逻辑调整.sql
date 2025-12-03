--银行险种默认生存金领取方式  0-自动转账  1-累积生息  3-转入万能账户
select a.* from ldcode a where codetype='ybtgetliveRisk' and code in ('1033042','');

select a.* from ldcode a where codetype='addinsuracc';