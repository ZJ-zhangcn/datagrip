/*
医疗：1066011-上海人寿康爱保A款医疗保险   5000118341230040
新增附加险：1056026-上海人寿守沪神重大疾病保险   2025010200000476
减额交清：1016008-上海人寿沪申福（安福版）终身寿险   2025010100001976
期交万能：1303014-上海人寿盛世恒盈两全保险（万能型）  签单日<生效日：2024123000000376   签单日>生效日：2025010300000116
生存金+满期金：1036003-上海人寿沪申宝（明珠版）养老年金保险   2025011500000516   2025011600000166
满期金：1003007-上海人寿盛世鑫利B款两全保险
生存金转入万能账户：1311003-上海人寿增利宝铂金版2023终身寿险（万能型）+1016004-上海人寿沪申福（明珠版）终身寿险   2025010100002026
离职给付（AZ）：2062070-上海人寿健康保障委托管理产品
减保：311001-团体一年定期寿险   
非万能：签单日>生效日：2025010200000106   签单日<生效日：2024123000000466
团险：签单日>生效日：2025010600000186   签单日<生效日：2025012000000586   撤销保险合同:2025012100000186
红利：1133004-上海人寿稳赢添添养老年金保险（分红型）   2025011700000266   2025011700000356   2025011700000486
理赔：理赔收续期保费：2025012000000126   解除合同退保费+理赔退续期保费：1033029-上海人寿享赢添添安盈版B款养老年金保险   2025012000000306   2025012000000496
*/
--险种配置表
select startdate,enddate,a.* from lmriskapp a where riskcode in ('1033029','','','','')
select a.* from lmriskapp a where riskname like '%箐盛%'
--险种支持的销售渠道
select a.salechnl,a.* from ldriskrule a where riskcode in ('1003007','','','','','') order by a.riskcode,a.salechnl
--险种支持的保全项
select a.* from lmriskedoritem a where riskcode in ('2072004','','','','')
select a.* from lmriskedoritem a where edorcode='WT' and riskname like '%团体%'
select a.* from lmriskedoritem a where fintype like '%被保人重要资料变更%'
select distinct FINTYPE,edorcode,riskcode from lmriskedoritem where FINTYPE is not null;
--核心险种规则（新单录入、问题件修改、新单复核）
select a.* from lmriskcheckrule a where riskcode='1303014' and checklocal='FHWB'
--
select a.* from ldtask a where TASKDESCRIBE like '%新增%'

select a.* from lcpol a where riskcode='1016004'
select contno from lcpol a where prtno='5000118341230033'
--lcget
select contno,
       dutycode,
       getdutycode,
       (select getdutyname from lmdutygetalive where getdutycode = a.getdutycode and getdutykind = a.getdutykind union select distinct getdutyname from lmdutygetclm where getdutycode = a.getdutycode) getdutyname,
       (select codename from ldcode where codetype = 'annuitygetmode' and code = (select distinct annuitygetmode from lcduty where contno=a.contno)) 生存金领取方式,
       gettodate,
       getstartdate,
       getenddate,LiveGetType,polno,summoney
  from lcget a
 where contno = '2025010100002026'

--税率配置
select a.* from ldtaxrate a order by to_number(SERIALNO)
/*
delete from ldtaxrate where taxtype='0101'
*/

--算法
select a.* from LMCALMODETAX a order by to_number(CALCODE)

select BUINESSTYPE,BUINESSDATE,GRPCONTNO,CONTNO,TAXTYPE,MONEY,PRICE 价额,TAX 税额,STANDBYFLAG1,a.* from LJATAX a
where CONTNO='2025010200000476' and BUINESSDATE=date'2027-01-05'
select BUINESSTYPE,BUINESSDATE,GRPCONTNO,CONTNO,TAXTYPE,MONEY,PRICE 价额,TAX 税额,STANDBYFLAG1,a.* from LJATAX a
where GRPCONTNO='2025010600000186' and BUINESSTYPE='LC'
select round(100000/(1+0.1)*0.1,2) from dual
/*
delete from LJATAX a where CONTNO='2024123000000376'
*/
select a.* from ljatax a where CONTNO='2024123000000376'
select a.* from ljatax a where grpCONTNO='2025010600000186'
select a.* from lcinsureacctrace a where contno='2025010300000116'
select a.* from lcinsureaccfeetrace a where contno='2025010300000116'

select a.* from LISDATA.LPINSUREACCTRACE a where contno='2024123000000376'
select a.* from LISDATA.LPINSUREACCFEETRACE a where contno='2024123000000376'

--健康委托产品判断
is_helarisk(a.riskcode) = 'Y'







-- 创建序列，从 639877 开始递减
CREATE SEQUENCE LDTAXRATE_SERIALNO_SEQ
    START WITH 639877  -- 起始值
    INCREMENT BY -1    -- 每次递减 1
    MAXVALUE 639877    -- 设置最大值为起始值
    MINVALUE 0         -- 设置最小值为 0
    NOCACHE;

-- 创建触发器，在插入数据前自动生成 SERIALNO
CREATE OR REPLACE TRIGGER trg_generate_serialno
BEFORE INSERT ON LISDATA.LDTAXRATE  -- 触发器作用于 LDTAXRATE 表
FOR EACH ROW                        -- 行级触发器
BEGIN
    -- 生成 15 位长度的 SERIALNO，前导零补齐
    :NEW.SERIALNO := LPAD(LDTAXRATE_SERIALNO_SEQ.NEXTVAL, 15, '0');
END;
/

-- 插入数据
INSERT INTO LISDATA.LDTAXRATE (SERIALNO, TAXTYPE, RISKCODE, TAXRATE, STATUS, MANAGECOM, OPERATOR, MAKEDATE, MAKETIME,
                               MODIFYDATE, MODIFYTIME, STARTDATE, ENDDATE, STANDBYFLAG1, STANDBYFLAG2, STANDBYFLAG3)
SELECT NULL,  -- SERIALNO 由触发器自动生成，这里设为 NULL
       '0101',
       riskcode,
       0.100000,
       '0',
       '86',
       '001',
       DATE '2025-06-02',
       '10:30:32',
       DATE '2025-06-02',
       '10:30:32',
       DATE '2015-01-01',
       DATE '2045-01-01',
       null,
       null,
       null
FROM lmriskapp
WHERE riskcode NOT IN (SELECT riskcode FROM LDTAXRATE WHERE TAXTYPE = '0101');

-- 删除触发器
DROP TRIGGER trg_generate_serialno;

-- 删除序列
DROP SEQUENCE LDTAXRATE_SERIALNO_SEQ;