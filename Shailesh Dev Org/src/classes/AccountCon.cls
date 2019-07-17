public class AccountCon{
    
    public list<Account> AccountCon{
    
        set;
             
    }
        public String name{
        get;
            set;
            }
        public String phone{
         get;
            set;
            
        }
    public String Industry{
     get;
        set;
        
    }
    
      
        
    public list<Account> getAccountCon(){
    list<Account> ac = new list<Account>();
    
       ac = [select id,name,phone,industry from Account];
        return ac;
        
    }
    
      Account ac1 = new Account();
    
    public PageReference save(){

        
        ac1.Name =  Name;
        ac1.Phone =  phone;
        ac1.Industry = industry;
        
           upsert ac1;   
        return (new ApexPages.StandardController(Ac1)).view();

        
    }
    // return (new ApexPages.StandardController(Ac)).view();


}