update lcaddress set email=null where email='zhangjin05@sinosoft.com.cn';
update lcaddress set postaladdress='林校路街道义和庄北路10086号' where postaladdress like '%林校路街道义和庄北路%' and postaladdress!='林校路街道义和庄北路10086号';


select a.* from lcpol a where prtno='5000118250314268'