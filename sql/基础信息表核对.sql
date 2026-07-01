--费率表
select count(1) 费率表条数, sum(rate) 费率总和
from rt_1136006 a;
--现价表
select count(1)   现价表条数,
       sum(begcv) 年初现价总和,
       sum(endcv) 年末现价总和/*,
       sum(RPU)         RPU,
       sum(BEG_AFACTOR) Afactor_boy,
       sum(END_AFACTOR) Afactor_eoy,
       sum(CV_RPUAFACTORBEG) CVafRPU_boy,
       sum(CV_RPUAFACTOREND) CVafRPU_eoy*/
from cv_1136006 a;
--减额交清因子表
select sum(PUACOST), sum(cv1) "cv+", sum(cv2) "cv-"
from PUA_1111001 a;
--红利因子表
SELECT CASE
           WHEN BONUSGRADE = 'H' THEN '红利（红利利益）'
           WHEN BONUSGRADE = 'L' THEN '红利（保证利益）'
           ELSE '其他'
           END          AS 红利类型,
       COUNT(*)         AS 数据条数,
       SUM(BONUSFACTOR) AS 基本保险红利因子总和/*,
       SUM(JQBONUSFACTOR) AS 累积交清红利因子总和*/
FROM lobonusfactor
WHERE riskcode = '1136006'
GROUP BY BONUSGRADE;
--风险费率表
SELECT 风险等级,
       COUNT(*)  AS 数据条数,
       SUM(rate) AS 风险费率总和
FROM (SELECT CASE
                 WHEN minem = 0 AND sex = 0 THEN 'EM=0 男'
                 WHEN minem = 0 AND sex = 1 THEN 'EM=0 女'
                 WHEN minem = 1 AND sex = 0 THEN '0＜EM≤25 男'
                 WHEN minem = 1 AND sex = 1 THEN '0＜EM≤25 女'
                 WHEN minem = 26 AND sex = 0 THEN '25＜EM≤50 男'
                 WHEN minem = 26 AND sex = 1 THEN '25＜EM≤50 女'
                 WHEN minem = 51 AND sex = 0 THEN '50＜EM≤75 男'
                 WHEN minem = 51 AND sex = 1 THEN '50＜EM≤75 女'
                 WHEN minem = 76 AND sex = 0 THEN '75＜EM≤100 男'
                 WHEN minem = 76 AND sex = 1 THEN '75＜EM≤100 女'
                 WHEN minem = 101 AND sex = 0 THEN '100＜EM≤150 男'
                 WHEN minem = 101 AND sex = 1 THEN '100＜EM≤150 女'
                 WHEN minem = 151 AND sex = 0 THEN '150＜EM≤200 男'
                 WHEN minem = 151 AND sex = 1 THEN '150＜EM≤200 女'
                 ELSE '其他 (EM=' || minem || ', 性别=' || sex || ')'
                 END AS 风险等级,
             minem,
             sex,
             rate
      FROM fx_1303022
      where age > 17)
GROUP BY 风险等级, minem, sex
ORDER BY minem, sex;

select sex 性别, count(1) 数据条数, SUM(rate) 风险费率总和
from fx_1311006 a
where age between 0 and 104
group by sex
order by sex;

select *
from fx_1311006 a
where age > 103
order by age, sex;
