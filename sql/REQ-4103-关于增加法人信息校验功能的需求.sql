/*
上海人寿：XJ2024070101   1
上海蔚来汽车有限公司：XJ2024070103   1
上海比亚迪有限公司：XJ2024070104   1
*/

/*
3206915140702012   2024070200001316
3206915140628026   2024070100000896
*/

select comdocidtype,comdocidno,a.* from LDGrp a where customerno in (select customerno from lcgrpappnt where grpcontno='2024070200001316')

--企查查配置单证
select a.* from ldcode a where codetype='QCCCheckInfo' and code='32069151';
select a.* from ldcode a where codetype='BusinessRegStatus' order by code;
--
select EnterpriseCheck,a.* from LCGrpAppnt a where prtno=''

--交易日志表
select a.* from LCQccRunlog a where BUSINESSNO='5005190141017010';
--企业信息表
select * from LCComInfo a where BUSINESSNO='5005190141017034';
insert into LCComInfo (SERIALNO, BUSINESSNO, SEARCHKEY, KEYNO, COMPANYNAME, SOCIALCODE, CREDITCODE, OPERNAME, STATUS, STARTDATE, REGISTCAPI, REALCAPI, ORGNO, NO, TAXNO, ECONKIND, TERMSTART, TERMEND, TAXPAYERTYPE, PERSONSCOPE, INSUREDCOUNT, CHECKDATE, AREACODE, PROVINCE, CITY, COUNTY, BELONGORG, IMEXCODE, INDUSTRYCODE, INDUSTRY, SUBINDUSTRYCODE, SUBINDUSTRY, MIDDLECATEGORYCODE, MIDDLECATEGORY, SMALLCATEGORYCODE, SMALLCATEGORY, ENGLISHNAME, ADDRESS, ANNUALADDRESS, SCOPE, ENTTYPE, IMAGEURL, CANCELDATE, CANCELREASON, REVOKEDATE, REVOKEREASON, ORIGINALNAME, CHANGEDATE, STOCKNUMBER, STOCKTYPE, WEBSITELIST, EMAIL, MOREEMAILLIST, EMAILSOURCE, TEL, MORETELLIST, TELSOURCE, LONGITUDE, LATITUDE, BANK, BANKACCOUNT, BANKINFONAME, BANKINFOCREDITCODE, BANKINFOADDRESS, BANKINFOTEL, ISSMALL, SCALE, ANAME, BNAME, CNAME, DNAME, ISOFFICIALENGLISH, BACKUP1, BACKUP2, BACKUP3, BACKUP4, OPERATOR, MAKETIME, MAKEDATE, MODIFYTIME, MODIFYDATE)
values ('0000000145', '5005190140701013', '91310000741627329A', '6hspsyv9rbkee9vj59lrajvjisrlhvsvra', '上海比亚迪有限公司', '91310000741627329A', null, '何龙', '存续（在营、开业、在册）', '2002-08-12', '6350万美元', '6350万美元', '74162732-9', '310000400311804', '91310000741627329A', '有限责任公司（港澳台投资、非独资）', '2002-08-12', '2052-08-11', '增值税一般纳税人', '10000人以上', '74948', '2022-07-27', '310117', '上海市', '上海市', '松江区', '上海市市场监督管理局', null, 'C', '制造业', '39', '计算机、通信和其他电子设备制造业', '392', '通信设备制造', '3921', '通信系统设备制造', 'Shanghai Byd Co., Ltd.', '上海市松江区车墩镇香泾路999号', null, '一般项目：生产锂离子电池及其零件和部件、新型平板显示器件、新型电子元器件及相关零配件、汽车饰件模具、小型储能系统及模组梯次利用的设计、制造，手机整机及零部件设计、研发与技术转让，有色金属复合材料、新型合金材料及深加工，太阳能电池组件制造，电池检测（不含第三方检测），自有汽车租赁、上海市松江区香泾路999号内自有房屋租赁，汽车销售，销售公司自产产品。信息化与云计算集成服务及应用与销售；无线通信产品和自动控制设备的设计、技术开发、制造和销售；轨道交通通信、信号、自动售检票、环境与监控设备、综合监控、门禁安防等弱电系统、电力监控、火灾监控系统的集成、技术开发、装备制造和销售（涉及配额、许可证、专项规定、质检、安检等管理要求的，需按照国家有关规定取得相应许可证后开展经营业务）。（除依法须经批准的项目外，凭营业执照依法自主开展经营活动）', '0', 'https://image.qcc.com/logo/63e2e370e41fcc64e3b24e1c9a6c4950.jpg', null, null, null, null, null, null, null, null, '["http://www.bydauto.com"]', 'bydpo@byd.com', 'li.yuan35@byd.com, zhao.shuangyang@byd.com, wang.jingyue@byd.com', '2022年报, 2021年报, 2014年报', '18620330087', '021-57778888', '2022年报', '121.29175', '30.996852', '中国农业银行上海市松江区高桥支行', '03850520040019391', '上海比亚迪有限公司', '91310000741627329A', '上海市松江区车墩镇香泾路999号', '021-57778888', '0', 'L', '通讯服务', '通信设备及技术服务', '通信设备', '通信网络设备及器件', '0', null, null, null, null, '001', '16:52:52', to_date('05-07-2024', 'dd-mm-yyyy'), '16:52:52', to_date('05-07-2024', 'dd-mm-yyyy'));
--受益人表
select * from LCBenifit a where BUSINESSNO='5005190141017010';
insert into LCBenifit (SERIALNO, BUSINESSNO, SEARCHKEY, COMPANYNAME, SOCIALCODE, BENIFITTYPE, POSITION, REMARK, KEYNO, FINDMATCHED, OPERNAME, OPERATOR, MAKETIME, MAKEDATE, MODIFYDATE, MODIFYTIME, BACKUP1, BACKUP2, BACKUP3)
values ('0000000015', '5005190140701013', '91310115599745323D', '致同会计师事务所（特殊普通合伙）上海分所', null, '负责人', '负责人', '未能穿透识别出直接或者间接拥有超过25%（含）公司股权或者表决权的自然人，未能识别出人事财务控制人，将存在控制或影响的自然人/高级管理人员视同为受益所有人，但由于该公司是分公司，因此显示其总公司的高级管理人员', '6ihphysm59pieirjvl9kb993il5kvbv3kh', 'N', '李惠琦', '001', '14:37:02', to_date('12-07-2024', 'dd-mm-yyyy'), to_date('12-07-2024', 'dd-mm-yyyy'), '14:37:02', null, null, null);
--股权穿透结果列表
select a.* from LCBnfOwner a where BUSINESSNO='5005190140701013';
--企业受益股东穿透详情
select a.* from LCBreakThrough a where BUSINESSNO='5005190140701013';
--高级管理人员列表
select a.* from LCSmanent a where BUSINESSNO='5005190140701013';
--有效控制或实际影响的组织/个人列表
select a.* from LCEffectiveol a where BUSINESSNO='5005190140701013';
/*
delete from LCQccRunlog where BUSINESSNO='5005190141017010';
delete from LCComInfo where BUSINESSNO='5005190141017010';
delete from LCBenifit where BUSINESSNO='5005190141017010';
delete from LCBnfOwner where BUSINESSNO='5005190141017010';
delete from LCBreakThrough where BUSINESSNO='5005190141017010';
delete from LCSmanent where BUSINESSNO='5005190141017010';
delete from LCEffectiveol where BUSINESSNO='5005190141017010';
*/

--
select codename from ldcode where codetype = 'QCC_URL' and code='01'

/*
delete ldcode where CODETYPE='QCC_URL'  and CODE ='01';
insert into ldcode (CODETYPE, CODE, CODENAME, CODEALIAS, COMCODE, OTHERSIGN)
values ('QCC_URL', '01', 'http://10.52.200.38:20001/rmp/common/qichacha/httpGet', null, null, null);
*/



/*
delete ldcode where CODETYPE='QCC_URL'  and CODE ='01';
insert into ldcode (CODETYPE, CODE, CODENAME, CODEALIAS, COMCODE, OTHERSIGN)
values ('QCC_URL', '01', 'http://api.shanghailife.com.cn/rmp/common/qichacha/httpGet', null, null, null);
delete ldcode where CODETYPE='QCC_URL_secretKey';
insert into ldcode (CODETYPE, CODE, CODENAME, CODEALIAS, COMCODE, OTHERSIGN)
values ('QCC_URL_secretKey', '01', 'DAC5AAFD64E92365F097ECA3CB7D3D52', null, null, null);
delete ldcode where CODETYPE='QCC_URL_appkey' and CODE ='01';
insert into ldcode (CODETYPE, CODE, CODENAME, CODEALIAS, COMCODE, OTHERSIGN)
values ('QCC_URL_appkey', '01', '03df2ff748654ef3b75a8eeb414383d2', null, null, null);
delete ldcode where CODETYPE='QCCapi_2001' and CODE ='01';
insert into ldcode (CODETYPE, CODE, CODENAME, CODEALIAS, COMCODE, OTHERSIGN)
values ('QCCapi_2001', '01', 'https://api.qichacha.com/EnterpriseInfo/Verify', null, null, null);
delete ldcode where CODETYPE='QCCapi_1003' and CODE ='01';
insert into ldcode (CODETYPE, CODE, CODENAME, CODEALIAS, COMCODE, OTHERSIGN)
values ('QCCapi_1003', '01', 'https://api.qichacha.com/BeneficialOwner/GetInfo', null, null, null);
delete  ldcode where CODETYPE ='QCCOPENCHECK';
insert into ldcode (CODETYPE, CODE, CODENAME, CODEALIAS, COMCODE, OTHERSIGN)
values ('QCCOPENCHECK', 'Y', '', null, null, null);
*/
select code from ldcode where codetype = 'QCCOPENCHECK';