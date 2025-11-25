select a.* from lccontstate a where contno='2023120700000826';
select a.* from lcconthangupstate a where contno='2023120700000826';
select a.* from ldcode a where codetype='conthanguptype';
--保单失效状态
select a.* from ldcode a where codetype='contavailablereason';
select a.* from ldcode a where codetype='contterminatereason';
--满期终止
select a.*
  from lccont a
 where contno <> prtno
   and grpcontno like '000000%'
   and contno in (select contno
                    from lccontstate
                   where statetype = 'Terminate'
                     and state = '1'
                     and STATEREASON = '01')
 order by contno desc;

--退保终止
select a.*
  from lccont a
 where contno <> prtno
   and grpcontno like '000000%'
   and contno in (select contno
                    from lccontstate
                   where statetype = 'Terminate'
                     and state = '1'
                     and STATEREASON = '02')
 order by contno desc;

--解约终止
select a.*
  from lccont a
 where contno <> prtno
   and grpcontno like '000000%'
   and contno in (select contno
                    from lccontstate
                   where statetype = 'Terminate'
                     and state = '1'
                     and STATEREASON = '03')
 order by contno desc;

--理赔终止
select a.*
  from lccont a
 where contno <> prtno
   and grpcontno like '000000%'
   and contno in (select contno
                    from lccontstate
                   where statetype = 'Terminate'
                     and state = '1'
                     and STATEREASON = '04')
 order by contno desc;

--协退终止
select a.*
  from lccont a
 where contno <> prtno
   and grpcontno like '000000%'
   and contno in (select contno
                    from lccontstate
                   where statetype = 'Terminate'
                     and state = '1'
                     and STATEREASON = '05')
 order by contno desc;

--犹退终止
select a.*
  from lccont a
 where contno <> prtno
   and grpcontno like '000000%'
   and contno in (select contno
                    from lccontstate
                   where statetype = 'Terminate'
                     and state = '1'
                     and STATEREASON = '06')
 order by contno desc;

--核保状态
select a.* from ldcode a where codetype = 'uwflag';
--拒保
select a.* from lccont a where uwflag='1' and appflag='0' and contno=prtno and grpcontno like '000000%' and prtno in (select CONTPRTNO from ybtnonrealtimepol/*非实时保单该表有数据*/);
--延期
select a.* from lccont a where uwflag='2' and appflag='0' and contno=prtno and grpcontno like '000000%' and contno in (select contno from ybtnonrealtimepol);

--续期终止
select a.*
  from lccont a
 where contno <> prtno
   and grpcontno like '000000%'
   and appflag='4'
   and contno in (select contno
                    from lccontstate
                   where statetype = 'Available'
                     and state = '1'
                     and STATEREASON = '01')
 order by contno desc;

--贷款终止
select a.*
  from lccont a
 where contno <> prtno
   and grpcontno like '000000%'
   and contno in (select contno
                    from lccontstate
                   where statetype = 'Available'
                     and state = '1'
                     and STATEREASON = '04')
 order by contno desc;