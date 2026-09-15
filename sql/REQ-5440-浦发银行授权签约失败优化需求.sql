--直联补录表
SELECT a.*
FROM YBTDirCollCont a
WHERE PROPOSALPRTNO = '5000118260812235';

SELECT a.*
FROM ljspay a
WHERE otherno = '5000118260812235';

update YBTDirCollCont
set APPNTNAME='浦发投保',
    BANKCODE='0117',
    ACCNO='12345678',
    APPNTIDNO='362229199601100487'/*,
    errflag=null*/
where PROPOSALPRTNO = '5000118260812235';

update YBTDirCollCont
set APPNTNAME='银保投保七九',
    BANKCODE='0117',
    ACCNO='123',
    APPNTIDNO='362229200801100591',
    errflag=null
where PROPOSALPRTNO = '5000118260812235';

SELECT a.*
FROM YBTPFSignStateResult a
WHERE prtno = '5000118260812235';


SELECT *
FROM lccont a
WHERE prtno = '5000118260812235';

SELECT a.*
FROM latask a
WHERE taskclass = 'YbtDirectCollectionReturnTask';

SELECT a.*
FROM ljspay a
WHERE otherno = '5000118260812235';
