-- id: req-3982
-- 标题: 核心需求req-3778与报价系统需求xj-12在关于地址四段式地址数据后台对接问题的需求

select unitprovince           单位注册地址省,
       unitcity               单位注册地址市,
       unitdistrict           单位注册地址县区,
       unitregdetaddress      单位注册地址详细地址,
       unitregisteredprovince 单位地址省,
       unitregisteredcity     单位地址市,
       unitregistereddistrict 单位地址县区,
       unitdetaddress         单位地址详细地址,
       a.*
  from lcask a
 where askno like 'XJ2025%%'
 order by askno desc;

select exppeoples,a.* from lcask a where askno = 'XJ2025032603';

select unitprovince           单位注册地址省,
       unitcity               单位注册地址市,
       unitdistrict           单位注册地址县区,
       unitdetaddress         单位注册地址详细地址,
       unitregisteredprovince 单位地址省,
       unitregisteredcity     单位地址市,
       unitregistereddistrict 单位地址县区,
       unitregisteredaddress  单位地址详细地址,
       a.*
  from lcgrpcontbak a
 where grpcontno = '2024022800000176';

select signdate,a.* from lcgrpcont a where grpcontno='2024013100000186';

select a.* from lcgrpaddress a where customerno='1060092025';

select * from ldpostcode where province='上海市' and area='松江区';

select * from ldplace where  province = '310000' and city = '310000' and country = '310117';

select a.* from ldtask a where taskdescribe like '%询价%';

select a.* from ldtaskplan a where taskcode='000315';

select a.* from grfq.lccontplanbak@ask a where grpcontno = '2024013100000186';

select * from ldcode c where c.codetype = 'ybtsendtobank';