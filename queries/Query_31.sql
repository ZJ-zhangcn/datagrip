select case
         when  2 in ('1','2') then
            26.47 /1000 *
          (c.cv2 * 0.0 + c.cv1 * (1-0.0))
         when  2=0 then
           26.47 /1000 *c.cv2
       else 0 end
  from PUA_1136003 c
 where c.gender = (select insuredsex from lcpol where polno = '210010000773097')
   and c.age = (select insuredappage from lcpol where polno = '210010000773097')
   and c.dt = '2'