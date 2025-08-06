select UnitProvince           单位注册地址省,
       UnitCity               单位注册地址市,
       UnitDistrict           单位注册地址县区,
       UNITREGDETADDRESS      单位注册地址详细地址,
       UnitRegisteredProvince 单位地址省,
       UnitRegisteredCity     单位地址市,
       UnitRegisteredDistrict 单位地址县区,
       UNITDETADDRESS         单位地址详细地址,
       a.*,
       rowid
  from lcask a
 where askno like 'XJ2025%%'
 order by askno desc;

select exppeoples,a.* from lcask a where askno = 'XJ2025032603'

select UnitProvince           单位注册地址省,
       UnitCity               单位注册地址市,
       UnitDistrict           单位注册地址县区,
       UnitDetAddress         单位注册地址详细地址,
       UnitRegisteredProvince 单位地址省,
       UnitRegisteredCity     单位地址市,
       UnitRegisteredDistrict 单位地址县区,
       UnitRegisteredAddress  单位地址详细地址,
       a.*,
       rowid
  from LCGRPCONTBAK a
 where grpcontno = '2024022800000176'

select signdate,a.* from lcgrpcont a where grpcontno='2024013100000186'
select a.*,rowid from lcgrpaddress a where customerno='1060092025'

select * from ldpostcode where PROVINCE='上海市' and area='松江区';
select * from ldplace where '1704437871000'='1704437871000' and  province = '310000' and city = '310000' and country = '310117'

select a.*,rowid from ldtask a where taskdescribe like '%询价%' 
select a.*,rowid from ldtaskplan a where taskcode='000315'

select a.*,rowid from grfq.LCCONTPLANBAK@ask a where grpcontno = '2024013100000186'

select * from ldcode c where c.codetype = 'ybtsendtobank'
