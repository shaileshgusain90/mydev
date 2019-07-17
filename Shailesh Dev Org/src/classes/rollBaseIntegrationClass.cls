public class rollBaseIntegrationClass {
    
    public String userName{get;set;}
    public String userPassword{get;set;}
           
    public String urlBody = '';
    public String arraySessionId{get;set;}

    public boolean isLoggedIn{get;set;}
    public boolean isLoggedOut{get;set;}
    public static final String errorMessage = 'Invalid Login : Username or Password is incorrect';
    
    public rollBaseIntegrationClass(){
        isLoggedIn = false;
        isLoggedOut = false;
    }

    public void methodTocallRollbase(){
       
        // Instantiate a new http object
        Http h = new Http();
            
        // Instantiate a new HTTP request, specify the method (GET) as well as the endpoint
        HttpRequest req = new HttpRequest();
                
        urlBody = 'https://www.rollbase.com/rest/api/login?loginName=' +userName+ '&password=' +userPassword+'&output=json';
                
        req.setEndpoint(urlBody);
        req.setMethod('POST');
            
        // Send the request, and return a response
        HttpResponse res = h.send(req);

        if(res.getStatus() != 'ok'){
            ApexPages.Message myMsg = new ApexPages.Message(ApexPages.severity.Error,errorMessage);
            apexpages.addmessage(myMsg);
            isLoggedIn = false;
            isLoggedOut = false;

      
        }else{
            isLoggedIn = true;
            isLoggedOut = true; 
            parseResposne(res.getBody());
        }

    }
    
     public void methodTocallRollbaseLogOut(){
        
        isLoggedIn = false;
        isLoggedOut = false;
        // Instantiate a new http object
        Http h = new Http();
            
        // Instantiate a new HTTP request, specify the method (GET) as well as the endpoint
        HttpRequest req = new HttpRequest();
                
        urlBody = 'https://www.rollbase.com/rest/api/logout?&output=json';
        
        req.setHeader('sessionId',arraySessionId);        
        req.setEndpoint(urlBody);
        req.setMethod('GET');
            
        // Send the request, and return a response
        HttpResponse res = h.send(req);
        system.debug('----->' + res.getBody()); 
        
        userName = '';
    }
    
    public void parseResposne(String responseFromRollBase){
        
        Util_JSONParser parser = Util_JSONParser.createParser(responseFromRollBase); 
        if(parser.get('sessionId').Value != null){
            arraySessionId = parser.get('sessionId').Value;
        } 
       
    }
            
}