public class PageRefer{
    
    

    public  static PageReference redirection(id contactId){
                
system.debug('########################' + ContactId);
        
        pageReference pr = new pageReference('/' + contactId );
       // system.debug('########################' + pr);
        pr.setRedirect(True);
        return pr;
    }
}