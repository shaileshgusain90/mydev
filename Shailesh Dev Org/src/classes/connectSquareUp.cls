public class connectSquareUp{
        
        public string Personal_Access_Token = 'IROWXPcMZQGMIZJQnpEHw';
         
    public void doIt(){    
     
         HttpRequest req = new HttpRequest();
         req.setHeader('Authorization','Bearer Egtpp1-vlpJOwhtybTDrQw');
       req.setHeader('Content-Type', 'application/json');
        req.setHeader('Accept','application/json');
         string endPoint =  'https://connect.squareup.com/v1/me/payments';
         req.setMethod('GET');
         req.setEndPoint(endPoint);
         Http http = new Http();
         HTTPResponse res = http.send(req);
         System.debug('!!!!!!!!!!!!!' + res.getBody());
        
        
             }
             }