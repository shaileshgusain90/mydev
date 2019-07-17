public class CreateYammerAccount{
 
         @future(callout=true)
     public static void createNewYammer(string ab){
           
            HttpRequest req = new HttpRequest(); 
  //Set HTTPRequest header properties
           req.setHeader('content-type', 'applicaton/json');
           req.setheader('host','www.yammer.com');
           req.setHeader('Authorization', 'Bearer 6kc9WQ5aEfzik8K6ZL5O2Q');
           string message1= 'An account with name ';
           message1 = encodingUtil.urlEncode(message1,'UTF-8');
           string message2 =    ' has been created ';
           message2 = encodingUtil.urlEncode(message2,'UTF-8');
           string accName = ab;
           accName =  encodingUtil.urlEncode(accName,'UTF-8');
           string endpoint1 = 'https://www.yammer.com/api/v1/messages.json?body='+message1+accName+message2;

           req.setEndpoint(endpoint1);
           req.setMethod('POST');
           Http http = new Http();
  
           try {
            //Execute web service call here     
                HTTPResponse res = http.send(req);  
                system.debug('!!!!!!!!!!!!' + res.getBody());

            //Helpful debug messages
                System.debug(res.toString());
                System.debug('STATUS:'+res.getStatus());
                System.debug('STATUS_CODE:'+res.getStatusCode());
        
                } catch(System.CalloutException e) {
            //Exception handling goes here....
                }       
             }
         }