public class BulkDeleteController
{
public List<accountwrapper> accountList {get;set;}
public List<Account> selectedAccounts = new List<Account>();
public List<accountwrapper> getAccounts()
{
//accountList = new List<accountwrapper>();
// for(Account a: [select Id, Name, AccountNumber, Phone from Account limit 5])
//accountList.add(new accountwrapper(a));
return accountList;
}
public BulkDeleteController (){
accountList = new List<accountwrapper>();
for(Account a: [select Id, Name, AccountNumber, Phone from Account limit 5])
accountList.add(new accountwrapper(a));
//return accountList;
}
public PageReference getSelected()
{
selectedAccounts.clear();
for(accountwrapper accwrapper: accountList)
if(accwrapper.selected == true)
selectedAccounts.add(accwrapper.acc);
return null;
}
public List<Account> GetSelectedAccounts()
{
if(selectedAccounts.size()>0)
return selectedAccounts;
else
return null;
}
public PageReference deleteAll()
{
List<Account> selAccounts=GetSelectedAccounts();
if(selAccounts.size()>0){
for(Account ac:selAccounts){
delete ac;
System.debug('###########Data Deleted Successfully###########');
}
}
ApexPages.addMessage( new ApexPages.Message(ApexPages.Severity.ERROR, 'Deleted successfully'));
return null;
}
public class accountwrapper
{
public Account acc{get; set;}
public Boolean selected {get; set;}
public accountwrapper(Account a)
{
acc = a;
selected = false;
}
}
}