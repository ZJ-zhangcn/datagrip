-- id: req-4950
-- 标题: 保全强制终止后拆单扣费成功的金额自动退回客户

select a.* from lysendtobank a where polno='7402121100347938';

select a.* from lpedoritem a where contno='2025082100000196'

select a.* from ljspay a where otherno='7402121100347938' order by makedate,maketime;

--20251010_44092

select * from splitcont where getnoticeno='86000020250310000324' order by makedate,maketime;

select a.* from ljaget a where otherno='7402121100347938'

select a.* from ljagetendorse a where contno='2025082100000196';