public class wrapperClassController {
    public List<Account> tempAcct = new List<Account>();
    public Map<ID,List<contact>> AcctContMAP = new Map<ID,List<contact>>();
    public Set<ID> AcctIDs = new Set<ID>();
    public List<wrapper> wrapout {get; set;}
    //constructor
    public  wrapperClassController(){
       wrapout = new List<wrapper>();
    }    
    class wrapper{
        public Account acct {get; set;}
        
        public List<wrapper2> conts {get; set;}
        public wrapper(){
            if(acct==null){acct = new Account();}
            if(conts==null){conts = new List<wrapper2>();}
            
        }
        

    }
    //wrapper 2 - the sub-wrapper
    class wrapper2{
    public Boolean selected {get; set;}
        public Contact cont {get; set;}
        
        public wrapper2(){
            if(cont==null){cont = new Contact();}//initialize the Contact holder
            selected = false;
        }
    }
    
   
    public PageReference buildwrapper() {
        tempAcct = [select id,name from Account where id in (select accountid from Contact) limit 10];
        for(Account a:tempAcct){AcctIDs.add(a.id);}
        for(contact c:[select id,name,phone,email, Accountid from contact where Accountid=:AcctIDs]){
            if(AcctContMap.containsKey(c.accountid)){
                AcctContMap.get(c.Accountid).add(c);//adds contact for this account to the cont list in the map    
            }else{
                AcctContMap.put(c.Accountid,new List<contact>{c});//adds new contact list for this account to the map    
            }
        }
        for(Account aa:tempAcct){
            wrapper tmpwrapper = new wrapper();
            tmpwrapper.acct=aa;
            List<wrapper2> t2 = new List<wrapper2>();
            for(contact cc:AcctcontMap.get(aa.id)){
                wrapper2 twrap2 = new wrapper2();
                twrap2.cont = cc;
                t2.add(twrap2);
            }
            tmpwrapper.conts=t2;
            wrapout.add(tmpwrapper);
        }


        return null;
    }

    
}