/*
SELECT zjagentcode,a.* FROM LCContRenewal a WHERE ContNo = '2026080600001176';
*/

--Ðø±£³éµµ»Ø¹ö
DELETE FROM LCCRenewalUWError
 WHERE ContNo = '2026080600001176'
   AND UWNo IN (
     SELECT UWNo FROM LCRenewalUWMaster
      WHERE ContNo = '2026080600001176'
        AND Operator = 'RenewalTask'
   );

DELETE FROM LCRenewalUWMaster
 WHERE ContNo = '2026080600001176'
   AND Operator = 'RenewalTask';

DELETE FROM LCContRenewal
 WHERE ContNo = '2026080600001176'
   AND Operator = 'RenewalTask';

DELETE FROM SMS_DISPATCH_LIST
 WHERE OTHERNO = '2026080600001176'
   AND SERVICEID IN ('Xb1001','Xb2001','Xb2002')
   AND OPERATOR = 'renewalTask';