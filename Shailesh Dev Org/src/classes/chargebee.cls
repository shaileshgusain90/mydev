@RestResource(urlMapping='/chargebee/*')
global class chargebee 
{     

   @HttpPost
   global static void doPost(){

        RestRequest req = RestContext.request;
        system.debug('kkkk'+req );
        Blob body = req.requestBody;
        String bodyString = body.toString();    
        system.debug('====='+bodyString);           
   }      
}