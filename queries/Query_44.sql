
select (case
         when ?Duration? >= 5 and bonusgetmode = '3' then
          ?Amnt? + (select nvl(sum(amnt),0) from lcduty where contno = '?ContNo?' and length(dutycode) = 10 and substr(dutycode,7,1) = '1')
         when ?Duration? >= 5 then ?Amnt?
         else 0
       end)
  from lcpol a
 where contno = '?ContNo?' and riskcode = '1136003'
