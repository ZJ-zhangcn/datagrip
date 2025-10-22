/*
接口报文测试流程：
  1、接口路径：
    App端：
      APP001-核保接口：
        dat:http://10.52.200.101:8001/lisdat/services/OnlineSaleService?wsdl
        pre:http://10.52.200.113:8001/services/OnlineSaleService?wsdl
    经代通端：JDT001-核保接口：
        dat:http://10.52.200.101:8001/lisdat/services/AgentSaleService?wsdl
        pre:
  2、获取报文（可先从前端正常投保一单获取）：
    --请求报文：TRANTYPE=0  响应报文：TRANTYPE=1
    select * from tranxml where LOGNO in (select LOGNO from tranapp where prtno='5000110900005716');
  3、将获取的报文转为Base64编码：GBK转Base64
    https://the-x.cn/encodings/Base64.aspx
  4、soapui请求接口：
    新建requests请求，格式<cData xsi:type="xsd:base64Binary">转码后的报文</cData>
  5、发送请求
*/
--
select a.* from ldcode a where codetype = 'relation';

--产品支持的销售渠道
select a.* from ldriskrule a where riskcode in ('1033019');

insert into ldriskrule (RISKCODE, SALECHNL, COMGROUP, STARTPOLAPPLYDATE, ENDPOLAPPLYDATE, STARTSCANDATE, STARTSCANTIME, ENDSCANDATE, ENDSCANTIME, OPERATOR, MAKEDATE, MAKETIME, MODIFYDATE, MODIFYTIME)
values ('1033019', '02', '86', to_date('01-11-2006', 'dd-mm-yyyy'), null, to_date('01-11-2006', 'dd-mm-yyyy'), '0       ', null, null, '1', to_date('01-05-2009', 'dd-mm-yyyy'), '0       ', to_date('01-05-2009', 'dd-mm-yyyy'), '0       ');