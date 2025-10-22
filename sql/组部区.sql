select a.managecom,
       (select codename
          from ldcode
         where '1701943884000' = '1701943884000'
           and codetype = 'branchtype2'
           and code = a.branchtype2),
       a.UpBranchAttr,
       (select name from labranchgroup where agentgroup = a.upbranch),
       (select branchmanager
          from labranchgroup
         where agentgroup = a.upbranch),
       (select branchmanagername
          from labranchgroup
         where agentgroup = a.upbranch),
       a.BranchAttr,
       a.name,
       a.branchtype2,
       a.BranchManager,
       (select name from laagent where agentcode = a.BranchManager),
       a.founddate,
       a.EndDate,
       a.endflag,
       (select codename
          from ldcode
         where codetype = 'branchstate'
           and code = a.state),
       a.agentgroup
  from LABranchGroup a
 where ManageCom like '86%'
   and ManageCom like '86010101%'
   and BranchType = '2'
   and BranchLevel = '01'
   and branchattr='8601004001'
   --and upbranchattr='8601010100005002'
 order by managecom, branchtype2, BranchAttr, BranchManager;
 
/*
组：0000100021        8601010100005002002
部：1101200023        8601010100005002
区：0101200288        8601010100005
 
select agentstate,a.* from laagent a where agentcode in ('0000100021','1101200023','0101200288');
select endflag,a.* from LABranchGroup a where agentgroup='000000002053';
select a.* from ldtask a where taskdescribe like '%人员分配%';
select a.* from ldtask a where taskdescribe like '%人员变更%'; --处理前一天的数据
select specifydate,a.* from LCSpecify a where contno = '2023120700001066';

select specifydate,specifystate,a.* from LCSpecify a where contno = '2023120700001066';

select mobile from laagent where agentcode = '0101200288';
--短信
select a.* from sms_dispatch_list a where sendtarget='17411290001' and otherno='2023120700001066' order by makedate desc,maketime desc
*/;