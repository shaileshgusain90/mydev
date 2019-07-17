public class LinkedInIntegrationController {

    public String LinkedinData { get; set; }
 
//Pass in the endpoint to be used
 public String responseBody{get;set;}
 public String authCode{get;set;}
 public String authorizationCodeURI{get;set;}
 public String body{get;set;}
 
public LinkedInIntegrationController(){
 
 authCode = ApexPages.currentPage().getParameters().get('code');
 authorizationCodeURI = 'https://www.linkedin.com/uas/oauth2/authorization?response_type=code&client_id=vcsdj2ell31l& state=DCEEFWF45453sdffef424&redirect_uri=https://c.ap1.visual.force.com/apex/LinkedInPage';
 HttpResponse resToken;
 if(authCode != NULL){
 
//POST Request by using the authorization code
 Http hToken = new Http();
 HttpRequest reqToken = new HttpRequest();
 reqToken.setEndpoint('https://www.linkedin.com/uas/oauth2/accessToken?grant_type=authorization_code&code='+authCode+'&redirect_uri=https://c.ap1.visual.force.com/apex/LinkedInPage&client_id=vcsdj2ell31l&client_secret=D88uZlvouRDII2u1');
 reqToken.setMethod('POST');
 resToken = hToken.send(reqToken);
 body = resToken.getBody();
 
JSONWrapper jsonWrapObj = (JSONWrapper)JSON.deserialize(body, JSONWrapper.class);
 
//GET Request by using the access token
 Http h=new Http();
 HttpRequest req = new HttpRequest();
 req.setEndpoint('https://api.linkedin.com/v1/people/~/email-address?oauth2_access_token='+jsonWrapObj.access_token);
 req.setMethod('GET');
 req.setHeader('Content-Type','application/xml');
 HttpResponse res = h.send(req);
 responseBody = res.getBody();
}
 }
 
public class JSONWrapper{
 
public Integer expires_in;
public String access_token;
 
}
}