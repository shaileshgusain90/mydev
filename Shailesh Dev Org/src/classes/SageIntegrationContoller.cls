public with sharing class SageIntegrationContoller {


public static string m_id = '187518363919';
public static String key = 'Q6P5M3J8C7M5';
public static string xml;
public static string datas;
public static string datas1;
public static string referenceToken;
public static string puts;
public static string endpointURL= 'https://gateway.sagepayments.net/web_services/gateway/api/retailtransactions';


public static string doAuthorize()
                                 
    {
   
     /* xml  = '<RetailTransactionRequest xmlns:i="http://www.w3.org/2001/XMLSchema-instance"; xmlns="http://schemas.datacontract.org/2004/07/wapiGateway.Models">';
      xml  +=   '<C_NAME>'+Name+'</C_NAME><C_ADDRESS>'+address+'</C_ADDRESS><C_CITY>'+city+'</C_CITY>';
      xml  +=  '<C_STATE>'+state+'</C_STATE><C_CARDNUMBER>'+cardNumber+'</C_CARDNUMBER>';
      xml  +=  '<C_EXP>'+expdate+'</C_EXP><C_CVV>'+cvv+'</C_CVV>';
      xml  +=  '<C_ZIP>'+zip+'</C_ZIP><C_EMAIL></C_EMAIL><C_TELEPHONE></C_TELEPHONE>';
      xml  += '<T_AMT>1.00</T_AMT>';
        // The ApplicationID here is 'DEMO' when you're done with development we will certify your integration 
        // (it's quick & easy)and provide a production value.
      xml  +=  '<T_APPLICATION_ID>DEMO</T_APPLICATION_ID>';
      xml  +=  '<T_CODE>2</T_CODE>';
      xml  +=  '<T_UTI></T_UTI>';
      xml  +=  '<VaultTransactionRequest><RequestType>CREATE</RequestType></VaultTransactionRequest></RetailTransactionRequest>';
      system.debug('%%%%%%%%%'+xml);*/
         xml  = '<RetailTransactionRequest xmlns:i="http://www.w3.org/2001/XMLSchema-instance"; xmlns="http://schemas.datacontract.org/2004/07/wapiGateway.Models">';

   xml+='<C_name>JOHN DOE CARDHOLDER</C_name><C_address>1234 BILLING STREET</C_address><C_city>BILLING TOWN</C_city><C_state>VA</C_state><C_zip>22102</C_zip><C_country>US</C_country><C_ship_name>JOHN DOE CARDHOLDER</C_ship_name><C_ship_address>1234 SHIPPING LANE</C_ship_address><C_ship_city>SHIP TO TOWN</C_ship_city><C_ship_state>VA</C_ship_state><C_ship_zip>22108</C_ship_zip><C_ship_country>US</C_ship_country><C_telephone>800-261-0240</C_telephone><C_fax>210-402-0432</C_fax><C_email>john_doe@mail.com</C_email><C_cardnumber>4111111111111111</C_cardnumber><C_exp>0520</C_exp><T_amt>123.25</T_amt><T_code>2</T_code>';
      xml  +=  '<VaultTransactionRequest><RequestType>CREATE</RequestType></VaultTransactionRequest></RetailTransactionRequest>';

      string payment =  generateHashMac(xml,endpointURL,'POST');
           payment = payment.replace('+','');
           payment = payment.replace('/','');
   
   
         Http h = new Http();
         HttpRequest req = new HttpRequest();
     
         req.setHeader('Host', 'gateway.sagepayments.net');
        
         req.setHeader('Content-Type', 'application/xml');
         req.setHeader('Content-Length', '218');
        
         req.setHeader('Accept','application/xml'); 
 
         req.setHeader('Authentication', m_id +':'+ payment);
         req.setHeader('Charset', '=utf-8');
        
         req.setEndpoint(endpointURL);
        
        // system.debug('?????????????????' + req);
       
         req.setbody(xml);
  
         req.setMethod('POST');
          req.setTimeout(60000);
         HttpResponse res = h.send(req);
         system.debug('%%%%%%%%%'+res.getBody());
          system.debug('%%%%%%%%%'+ res.getStatusCode());
         string s2='http://schemas.datacontract.org/2004/07/wapiGateway.Models';
         
         if(res.getStatusCode()==201 || res.getStatusCode()==200 ){
            
             Dom.Document docx = res.getbodyDocument();
             dom.XmlNode xroot = docx.getrootelement() ;
             system.debug(xroot + 'ooooooooooooooooooooooo');
             referenceToken = (xroot.getChildElement('Reference',s2).gettext()!=Null?xroot.getChildElement('Reference',s2).gettext():'a');
             string indicator=(xroot.getChildElement('Indicator',s2).gettext()!=Null?xroot.getChildElement('Indicator',s2).gettext():'a');
             string result = referenceToken+'#'+indicator;
             return result;
        
            }
            
            else{
                return 'NotProcessed';
            }
     
      }
 
 
 
   // To generate HashMac Authorisation Header
 public static string  generateHashMac(string xmls,string methodurl,string method){
    
       boolean redirect = false;
       string urlbody = method + methodurl + xmls;
       system.debug('Url;;;;;;;;;;;;' + urlbody);
       Blob data = crypto.generateMac('hmacSHA1',blob.valueof(urlbody), Blob.valueOf(key));
       datas =  EncodingUtil.base64Encode(data);
       datas = datas.replace('+','');
       datas = datas.replace('/','');
       system.debug(datas + 'saaaa1122333sssssssssssssss');
       return datas;
      
    }
      
 // Token Based Capturing     
   public static integer  doCapturePayment(string token){
   
         puts = '<CreditCardCaptureTransactionRequest xmlns:i="http://www.w3.org/2001/XMLSchema-instance"; xmlns="http://schemas.datacontract.org/2004/07/wapiGateway.Models"><T_AMT>0</T_AMT><T_TAX>0</T_TAX></CreditCardCaptureTransactionRequest>';
         endpointURL +='/'+token;
         Http h = new Http();
         HttpRequest req = new HttpRequest();
         req.setHeader('Host', 'gateway.sagepayments.net');
         req.setHeader('Content-Type', 'application/xml');
         req.setHeader('Content-Length', '218');
         req.setHeader('Accept','application/xml'); 
         string payments =  generateHashMac(puts,endpointURL,'PUT');
         payments = payments.replace('+','');
         payments = payments.replace('/','');
         system.debug(payments + '@@@@@@@@@@@pays@@@@@@@@@@@@@@@');
         req.setHeader('Authentication', m_id + ':' + payments);
         req.setHeader('Charset', 'utf-8');
         req.setMethod('PUT');
         req.setbody(puts);
         req.setEndpoint(endpointURL);
         HttpResponse res = h.send(req);
         integer i=res.getStatusCode();
         return i;
   }   

}