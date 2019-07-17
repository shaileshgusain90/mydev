public with sharing class herokuAuthentication {
	
	
	public static void doAuthorization(){
	         
	         string endpoint = 'https://api.heroku.com/oauth/authorizations';
	         http h = new http();
	         
	         httpRequest req = new httpRequest();
	         
	         req.setheader('Content-Type', 'application/json');
	         req.setheader('Accept','application/vnd.heroku+json ; version=3');
	         req.setHeader('Authorization', 'Bearer 490ebd59-b008-4d84-94c3-ca738a964969');
	        
	         req.setMethod('POST');  
             req.setEndpoint(endpoint);
             
             HttpResponse res = h.send(req); 
             system.debug('@@@@@@@@@@@' + res.getbody());
	
	}

}