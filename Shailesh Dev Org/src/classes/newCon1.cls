public class newCon1 {


    public final Account account;


  public newCon1(){

  Account = [select id,name from Account where id = : ApexPages.currentpage().getParameters().get('id')];
  system.debug(Account);
}

public Account getAccount(){

return Account;

}

  public pageReference save(){
   update Account;
   return null;
  
  }
}