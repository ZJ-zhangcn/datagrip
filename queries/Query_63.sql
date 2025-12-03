select bak1 /*是否为生存金产品*/,bak2 /*生存金是否配置*/,bak3 /*是否为红利领取产品*/,bak4 /*红利是否配置*/,STANDBYFLAG /*是否为年金产品*/,a.* from lmduty a where riskcode='1013015'

select bak1 /*是否为生存金产品*/,bak2 /*生存金是否配置*/,STANDBYFLAG /*是否为年金产品*/,a.* from lmduty a where riskcode='1013015'
select bak3 /*是否为红利领取产品*/,bak4 /*红利是否配置*/,a.* from lmduty a where riskcode='1013015'