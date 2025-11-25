SELECT a.* FROM LYInvoicingParty a where CUSTOMERNAME='上海比亚迪有限公司';
select a.* from LYSendBillOrder a where grpcontno='2025010600000186';
select CONFDATE,a.* from ljaget a where otherno='3229315100006333';
select a.* from ljpbalancerela a where grpcontno='2020103100000106';
UPDATE ljatax
set standbyflag2='3060301010000000000'
  , standbyflag3='一年期以上的返还性人身保险和健康保险服务'
where GRPCONTNO='2025010300000116';
select customername,TaxpayerIDNo from LYInvoicingParty where '1757654774000'='1757654774000' and  customername like'%环球%' and state='Y';