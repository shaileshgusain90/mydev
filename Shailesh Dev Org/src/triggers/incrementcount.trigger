trigger incrementcount on Contact (after insert,after update,after delete) {

list<contact> lts = new list<contact>();
list<Account> actlts = new list<Account>();
list<Account> actltss = new list<Account>();

 list<id> lt = new list<id>();
 
if(trigger.isinsert||trigger.isupdate){ 
 for(contact ac : trigger.new){
  lt.add(ac.Accountid);
  }
  }
 
 if(trigger.isDelete){ 
  for(contact ac : trigger.old){
    lt.add(ac.Accountid);
  
  }}
  
  
 actlts = [select id,name,(select id,name from contacts),gusainShailesh__count_cont__c from account where id in : lt];
  
 integer i = 0;
 
 for(Account a : actlts ){
 
     list<contact> con = new list<contact>();
     
     con = a.contacts;
     
     for(contact c : con){
     i++;
     } 
     
     a.gusainShailesh__count_cont__c = i;
     actltss.add(a);
 
 }
  
  
  update actltss;


}