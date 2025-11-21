select a.* from LYSENDTOBANK a where polno='7402121100347938';
select a.* from LPEDORITEM a where contno='2025082100000196'

select a.* from ljspay a where otherno='7402121100347938' order by MAKEDATE,MAKETIME;
--20251010_44092

select * from splitcont where GETNOTICENO='86000020250310000324' order by MAKEDATE,MAKETIME;
select a.* from ljaget a where otherno='7402121100347938'
select a.* from LJAGETENDORSE a where contno='2025082100000196';