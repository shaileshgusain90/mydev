public class RedirectExtentions{
    
    public string names{get;set;}
    public string phones{get;set;}
    public Account acc;
    //public String accName{get;set;}
    //public String accPhone{get;set;}


    public RedirectExtentions(ApexPages.StandardController controller) {
        
        Acc=(Account)controller.getRecord();
    }
    
    public PageReference savethis(){
        
        acc.name = names;
        acc.phone = phones;
        insert acc ;
        system.debug(acc + ' 000000000000000  name');
        
        String sessionID = UserInfo.getSessionId();
        system.debug(sessionID + 'vvvvvvvvvvvvvvvv');
   
        PageReference reRend = new PageReference('/apex/offlinepage');
        reRend.setRedirect(true);
        return reRend;
        }
    }