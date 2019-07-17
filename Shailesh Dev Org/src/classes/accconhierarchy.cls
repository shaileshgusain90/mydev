public class accconhierarchy {
    Private list<account> acc;
   
    public List<accountWrap> accountList { get; set; }
    public accconhierarchy (){
        List<contactWrap> cw;
        accountList = new List<accountWrap>();
        acc = [select id,name,industry,billingcountry ,createdbyId from account limit 20];
        
        for(account a:acc){
            cw = new list<contactWrap>();
            list<Account> childaccount = [Select id,name,industry,billingcountry,createdbyId from Account where parentId=:a.id];
            For(Account co :childaccount){
               cw.add(new contactWrap(co));
            }
            accountList.add(new accountWrap(a,false,cw));
        }
    }
   
    public class accountWrap{
        public account oAccount{get;set;}
        public boolean isSelected{get;set;}
        public List<contactWrap> contactset{get;set;}
        public accountWrap(account a,boolean b, List<contactWrap> c){
            oAccount=a;
            isSelected=b;
            contactset =c;           
        }
    }
   
    public class contactWrap{
        public Account oContact{get;set;}
        public boolean isSelected{get;set;}       
        public contactWrap(Account a){
            oContact=a;
            isSelected=false;                      
        }
    }
   
}