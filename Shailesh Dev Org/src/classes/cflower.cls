public class cflower {
 
    public PageReference method()   
     {
 
  
        //String ApiKey ='Wye3xufy8wL4GnEGmVmb'; 
     
       // Create a JSON generator object
        //JSONGenerator gen = JSON.createGenerator(true);
                   
         //String jsonOrders = gen.getAsString();

        //Construct HTTP request and response
        HttpRequest req = new HttpRequest();
        HttpResponse res = new HttpResponse();
        Http http = new Http();
 
        //Construct Authorization and Content header
       
      //  String authorizationHeader = jsonOrders;
        //req.setHeader('Authorization', authorizationHeader);
        req.setHeader('Content-Type','application/json');
 
        //Construct Endpoint
        String endpoint =' https://api.crowdflower.com/v1/jobs/upload.json';
        req.setMethod('PUT');
        req.setEndpoint(endpoint);
        req.setHeader('title', 'ERERERR');
       // req.setBody('"job": [{"title" : "Unit_Test_Job"}]');
       req.setBody('{"job[title]":"Teeeeest","job[instructions]":"Instructions", "state":"New", "data":"https://s3-us-west-2.amazonaws.com/orditalcrowdflower/16k-83-nameplate.jpg", "key":"Wye3xufy8wL4GnEGmVmb"}');
   //req.setbody('{"unit": { "data": "https://s3-us-west-2.amazonaws.com/orditalcrowdflower/16k-83-nameplate.jpg"}}');
   
        try {
          
           res = http.send(req);
           System.debug(res+'fffffffffffffff');
            System.debug(res.getBody());
        } catch(System.CalloutException e) {
            System.debug(string.valueof(e));
        }
        return null;
    }
 
}