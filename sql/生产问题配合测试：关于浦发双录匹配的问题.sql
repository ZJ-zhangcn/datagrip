select a.* from ybtmovietrace a where FILENAME in ('A.mp4','B.mp4','C.mp4','D.mp4','E.mp4','F.mp4');
                                    --prtno in ('5000118260428232','5000118260428256','5000118260428263','5000118260428270');
/*
delete from ybtmovietrace where FILENAME in ('A.mp4','B.mp4','C.mp4','D.mp4','E.mp4','F.mp4');
*/

select a.* from lccontmovie a where FILENAME in ('A.mp4','B.mp4','C.mp4','D.mp4','E.mp4','F.mp4');
                                  --prtno in ('5000118260428232','5000118260428256','5000118260428263','5000118260428270');
/*
delete from lccontmovie where FILENAME in ('A.mp4','B.mp4','C.mp4','D.mp4','E.mp4','F.mp4');
*/

select a.* from LIS.MOVIE a where prtno in ('5000118260428232','5000118260428256','5000118260428263','5000118260428270');
/*
delete from MOVIE where prtno in ('5000118260428232','5000118260428256','5000118260428263','5000118260428270');
*/

select contno,riskcode from lcpol a where prtno in ('5000118260428232','5000118260428256','5000118260428263','5000118260428270');


select * from ldcode1 where codetype='checkRisk' and code = '1033024';
select a.* from lmriskapp a where riskcode='1033024';

select a.* from ldtask a where taskclass like 'YBTContMovieMatchTask'