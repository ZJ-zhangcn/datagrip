
delete from llcase where caseno='3631815101011232';
delete from LLAccident where accno in (select caserelano from LLCaseRela where caseno='3631815101011232');
delete from LLCaseRela where caseno='3631815101011232';
delete from LLAppClaimReason where caseno='3631815101011232';
delete from LLFeeMain where clmno='3631815101011232';
delete from LLCaseReceipt where clmno='3631815101011232';
delete from LLClaimDetail where clmno='3631815101011232';
delete from LLClaimpolicy where clmno='3631815101011232';
delete from LLClaim where clmno='3631815101011232';
delete from LLClaimDutyKind where clmno='3631815101011232';
delete from LLBalance where clmno='3631815101011232';
delete from LLBnf where clmno='3631815101011232';
delete from LLBnfGather where clmno='3631815101011232';
delete from llregister where rgtno='3631815101011232';
delete from lbmission where missionprop1='3631815101011232';
delete from ljaget where otherno='3631815101011232';
delete from ljagetclaim where otherno='3631815101011232';
delete from loprtmanager where otherno='3631815101011232';
delete from lcconthangupstate where HANGUPNO='3631815101011232';
delete from ljsgetclaim where otherno='3631815101011232';
delete from llreport where rptno='3631815101011232';
delete from llsubreport where SUBRPTNO='3631815101011232';
delete from lwmission where missionprop1='3631815101011232';

