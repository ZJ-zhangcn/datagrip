select qualityteststate,a.*,rowid from lccontmovie a where prtno='5000118323511362'

--经代渠道双录质检结果查询清单
select qualityteststate,(select salechannels from lccont where prtno=a.prtno) 渠道, a.*, rowid
  from lccontmovie a
 where /*qualityteststate in ('7', '8')
   and */(select count(*)
          from lccontmovie
         where substr(prtno, 0, 16) = a.prtno) = 1
   and exists (select distinct 1
          from lccont
         where prtno = a.prtno
           and salechannels in ('070107',
                                '070307',
                                '070507',
                                '020101',
                                '020106',
                                '020201',
                                '020206',
                                '020306',
                                '021100',
                                '021101',
                                '021200',
                                '021201'))
 order by a.qualityteststate

--银保渠道双录质检结果查询清单
select qualityteststate, a.*, rowid
  from lccontmovie a
 where qualityteststate in ('', '8')
   and (select count(*)
          from lccontmovie
         where substr(prtno, 0, 16) = a.prtno) = 1
   and exists (select distinct 1
          from lccont
         where prtno = a.prtno
           and salechannels in ('030203',
                                '030303',
                                '030403',
                                '030803',
                                '031003',
                                '021303',
                                '021403'))
 order by a.qualityteststate

--个险渠道双录质检结果查询清单
select qualityteststate,(select salechannels from lccont where prtno=a.prtno) 渠道, a.*, rowid
  from lccontmovie a
 where /*qualityteststate in ('7', '8')
   and */(select count(*)
          from lccontmovie
         where substr(prtno, 0, 16) = a.prtno) = 1
   and exists (select distinct 1
          from lccont
         where prtno = a.prtno
           and salechannels in ('020502'))
 order by a.qualityteststate
