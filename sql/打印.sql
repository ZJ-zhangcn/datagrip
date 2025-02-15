------------------------------------------------------------------打印相关------------------------------------------------------------------
--打印平台（易高）共享的保单pdf路径：
	--配置在易高平台的产品，银保通，银保网银，都可以打印纸质保单，和电子保单
		--电子保单：
    /data/lis/xerox/runTimeFile/epolicy_yg/epolicy/secur/
		--纸质保单：
    /data/lis/xerox/runTimeFile/epolicy_yg/policy/secur/

--经代通/app，批处理后直接电子保单和纸质保单pdf（未切换打印平台的险种），通过批处理推送给百星打印
select * from ldtask t where t.taskdescribe like'%微信电子保单生成%'
--微信电子保单生成（非对接益高）:
/data/lis/xerox/runtimefile/epolicy/

--益高打印保单配置
select * from ldcode where codetype = 'dzytriskcode' and code='1056024'

--益高保单补发配置    补发只打印纸质保单，不打印电子保单
select * from ldcode1 where codetype='xmlPushYG'  and code='1006004'

--团险保单打印:
/data/lis/xerox/runTimeFile/epolicy_yg/tpolicyxml/

--补发只打印纸质保单，不打印电子保单
select * from ldcode1 where codetype='xmlpushyg'

--续期缴费通知书生成xml/pdf存放路径
select * from ldsysvar where sysvar like '%XQNewPayXml%'

--通知书发送批处理后文件存储路径：
/home/bxsftp/xq/shanghai/
10.52.200.121  bxsftp/sftp0605%

--恒盈回传excel路径：
/home/bxsftp/xq/acceptletterfile/202304
10.52.200.121  bxsftp/sftp0605%

--续期缴费成功生成对账单xml存放路径:
select * from ldsysvar where sysvar = 'xqcontpaybill'

--续期保单失效生成xml存放路径
select * from ldsysvar where sysvar = 'xqcontendxml'

--续期通知书打印
select t.standbyflag5,t.* from loprtmanager t where otherno='2023102400000286'

--保全和续期短信
select * from lcmeglog t where t.otherno='2022021700000496'

--核心生成通知书后第二天跑批处理发送恒盈进行打印
select * from ldtask t where t.taskdescribe like'%通知书xml发送%'

--续期信函个性化补寄，补打后重新生成的数据2021020100011586
select * from llettersreissue where contno='2023092000000186'
