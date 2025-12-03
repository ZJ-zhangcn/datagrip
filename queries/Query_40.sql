select case
         when  2 in ('1','2') then
            1300.45 /1000 *
          (c.cv2 * 0.03561643835616438 + c.cv1 * (1-0.03561643835616438))
         when  2=0 then
           1300.45 /1000 *c.cv2
       else 0 end
  from PUA_1111002 c
 where c.gender = (select insuredsex from lcpol where polno = '210310000004859')
   and c.age = (select insuredappage from lcpol where polno = '210310000004859')
   and c.dt = '8';

select c.* from PUA_1111002 c where c.gender = (select insuredsex from lcpol where polno = '210310000004859')
   and c.age = (select insuredappage from lcpol where polno = '210310000004859')