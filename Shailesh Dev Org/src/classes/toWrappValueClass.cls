public class toWrappValueClass{

public list<Account> accs = new list<Account>();
public list<AccountWrapperClass> wrap{get;set;}
public list<Account> acc {get;set;}

public Account newAcc{get;set;}

    public toWrappValueClass(){
         wrap = new list<AccountWrapperClass>();
         newAcc = new Account();
         
     accs = [select id ,name ,type,website from Account limit 10] ;  
  
      }
      
       public void showAccountList(){
      
          for(Account a : accs)
         
              AccountWrapperClass act = new AccountWrapperClass(a);
              //wrap.add(act);
              system.debug('######' + wrap);
              
          }
      
    
       public void selection(){
       
         acc = new list<Account>();
      for(AccountWrapperClass acs : wrap){
       
       if(acs.selected == true){
           acc.add(acs.acct);
       
       }
     }
   
       
       }   
      
  

    public class AccountWrapperClass{
         
         public Account acct {get;set;}
         public boolean Selected {get;set;}
         
         public AccountWrapperClass(Account ac){
         
               acct = ac;
               selected = false;
        
         
             }
         
        }

    }