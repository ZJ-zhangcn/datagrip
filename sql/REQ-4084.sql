-- id: req-4084
-- 标题: 关于新增证件有效期起期校验规则需求-app和经代通

/*
接口报文测试流程：
  1、接口路径：
    app端：
      app001-核保接口：
        dat:http://10.52.200.101:8001/lisdat/services/onlinesaleservice?wsdl
        pre:http://10.52.200.113:8001/services/onlinesaleservice?wsdl
    经代通端：jdt001-核保接口：
        dat:http://10.52.200.101:8001/lisdat/services/agentsaleservice?wsdl
        pre:
  2、获取报文（可先从前端正常投保一单获取）：

    --请求报文：trantype=0  响应报文：trantype=1
    select * from tranxml where logno in (select logno from tranapp where prtno='5000110900005716');
  3、将获取的报文转为base64编码：gbk转base64
    https://the-x.cn/encodings/base64.aspx
  4、soapui请求接口：
    新建requests请求，格式<cdata xsi:type="xsd:base64binary">转码后的报文</cdata>
  5、发送请求
*/
--
select a.* from ldcode a where codetype = 'relation';

--产品支持的销售渠道
select a.* from ldriskrule a where riskcode in ('1033019');

/*
insert into ldriskrule (riskcode, salechnl, comgroup, startpolapplydate, endpolapplydate, startscandate, startscantime, endscandate, endscantime, operator, makedate, maketime, modifydate, modifytime)
values ('1033019', '02', '86', to_date('01-11-2006', 'dd-mm-yyyy'), null, to_date('01-11-2006', 'dd-mm-yyyy'), '0       ', null, null, '1', to_date('01-05-2009', 'dd-mm-yyyy'), '0       ', to_date('01-05-2009', 'dd-mm-yyyy'), '0       ');
*/
