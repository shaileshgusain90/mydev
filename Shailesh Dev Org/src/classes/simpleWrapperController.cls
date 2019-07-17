public class simpleWrapperController{

    public list<AcctWrapper> AccountList{get;set;}
    public List<Account> selectedAccounts = new List<Account>();

public list<AcctWrapper> getAccounts(){

 if(AccountList==null){
 
 AccountList = new List<AcctWrapper>();
 
   for(Account ac : [select Id, Name, AccountNumber, phone from Account limit 10]) {
    AccountList.add(new AcctWrapper(ac));   
          
     }
  }
   return AccountList;
      } 
      
      
      
      public simpleWrapperController (){

}
  public PageReference getSelected()

{
selectedAccounts.clear();
for(acctwrapper accwrapper: accountList)
if(accwrapper.selected == true)
selectedAccounts.add(accwrapper.act);
return null;
}
public List<Account> GetSelectedAccounts()
{
System.debug('###########Data CHECKED###########' + GetSelectedAccounts());
if(selectedAccounts.size()>0)
return selectedAccounts;
else
return null;

}
public PageReference deleteAll()
{
System.debug('###########Data Deleted Successfully###########');
List<Account> selAccounts=GetSelectedAccounts();
if(selAccounts.size()>0){
for(Account ac:selAccounts){
delete ac;
System.debug('###########Data Deleted Successfully###########');
}
}
return null;
}
  
 public class AcctWrapper{

public account act{get;set;}
public boolean selected{get;set;}

public AcctWrapper(account a){
  act = a;
  selected = false;
}
}
}