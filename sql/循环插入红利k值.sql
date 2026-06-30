/*
delete from BONUSRATE where riskcode='1116004';
*/

/*
 * Oracle SQL �ű���ʹ�� INSERT...SELECT ������������
 * ֻ���޸� CONNECT BY LEVEL <= N �е� N ���ɿ��Ʋ�������
 */

/*
INSERT INTO BONUSRATE (
  RISKCODE,
  CVALIDATE,
  ENDDATE,
  BONUSGRADE,
  BONUSRATE
)
SELECT
  '1116004' AS RISKCODE,--��Ҫ�޸�
  ADD_MONTHS(DATE '2025-07-01', (LEVEL - 1) * 12) AS CVALIDATE,--��һ����ʼ�ڼ�
  ADD_MONTHS(DATE '2025-07-01', LEVEL * 12) - 1 AS ENDDATE,
  'H' AS BONUSGRADE,
  1.2 AS BONUSRATE
FROM
  dual
CONNECT BY
  LEVEL <= 50; -- ���� �˴������� 10 ��ΪҪ����ļ�¼���� (n) ����
*/

-- �ύ����
--COMMIT;

/*
select a.*
from BONUSRATE a
where riskcode = '1116004';
*/
