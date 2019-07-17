public class AccountSearch{

  public list<Account> Seach{get;set;}
  public string Search{get;set;}
  public Account at{get;set;}

 public void AccountSearch(){
 
   seach = database.query('select id,name from account where'+ '( name like \'%' + Search + '%\')');
 
 if(Seach.size()!=0){
 system.debug('@@@@@@@@@@@@@@@' + Seach );
   }
   else{
   
   ApexPages.addMessage(new ApexPages.message(ApexPages.severity.INFO,'there is no Account with this name'));
   
   }
   
   
  
 
 }

}