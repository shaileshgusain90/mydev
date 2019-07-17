public class postdatsa{



public static void value(){

   string jsonString = '{"name" :"shailesh"}';
   
     HttpRequest req = new HttpRequest();
    req.setMethod('POST'); 
    req.setEndpoint('https://webservice.herokuapp.com/order'); 
    req.setHeader('Content-Type', 'application/json');
    req.setBody(jsonString); 
    Http http = new Http(); 
   httpresponse res = new httpresponse();
    res = http.send(req); 

system.debug(res.getbody() +'##############');
}

}