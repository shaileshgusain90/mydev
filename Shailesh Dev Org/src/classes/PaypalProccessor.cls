public class PaypalProccessor{
           public  string amount{get;set;}
           public  String result {set;get;}
           public  string FirstName{get; set; }
           public  string LastName{get; set; }
           public  string Addy1{get; set; }
           public  string Addy2{get; set; }
           public  string Country{get; set; }
           public  string selectedCardType{get;set;}
           public  string CardNo{get; set; }
           public  string expMo{get; set; }
           public  string expYe{get; set; }
           public  string CVV{get; set; }
           public  string city{get; set; }
           public  string state{get; set; }
           public  string zip{get; set; }
           public  string payer{ get; set; }
           public  string transid {get; set;}
           public  string message {get; set; }
           public  string err {get; set; }
           public  string rawResponse {get; set; }
           public boolean isSuccess {get;set; }
           public boolean isAllowed {get;set; }
  
  
           public List<selectOption> getcardtype(){
      
              list<SelectOption> cardtype = new list<SelectOption>();
              cardtype.add(new selectOption('--None--','None--'));
                   cardtype.add(new selectOption('Visa','Visa'));
                   cardtype.add(new selectOption('MasterCard','MasterCard'));
                   cardtype.add(new selectOption('Discover','Discover'));
                   cardtype.add(new selectOption('Maestro','Maestro'));
                   cardtype.add(new selectOption('Amex','Amex'));
                   return cardtype;
          }
          
          public List<SelectOption> getExpMonth(){
       list<SelectOption> months = new list<SelectOption>();
       months.add(new selectOption('01','Jan'));
       months.add(new selectOption('02','Feb'));
       months.add(new selectOption('03','Mar'));
       months.add(new selectOption('04','Apr'));
       months.add(new selectOption('05','May'));
       months.add(new selectOption('06','Jun'));
       months.add(new selectOption('07','Jul'));
       months.add(new selectOption('08','Aug'));
       months.add(new selectOption('09','Sep'));
       months.add(new selectOption('10','Oct'));
       months.add(new selectOption('11','Nov'));
       months.add(new selectOption('12','Dec'));
       return months;
    }
    
       public List<SelectOption> getYears(){
       list<SelectOption> years = new list<SelectOption>();
       integer curMonth = system.today().year();
       for(integer i=1;i<10;i++){
           years.add(new selectOption(curMonth + '',curMonth++ + ''));
       }
       return years;
    }
          
 
          public PaypalProccessor(){
                    isAllowed = true;
                    city = '';
                    state = '';
                    zip = '';
                    CVV = '';
                   // expYe = '';
                  //  expMo = '';
                    CardNo = '';
                    FirstName = '';
                    LastName = '';
                    Country = '';
                    Addy1 = '';
                    Addy2 = '';
                    payer = 'shailesh.gusain@gmail.com';
                    amount = '';
                    err = '';
                    message = '';
                    //isvalid =true;
          }
 
 // i have input some default values as above
 
         public pageReference makePayement(){
                    
                      doDirectPayment(); 
                     if(!validate()){
                         isSuccess = false;
                      }
                    
                 return null;
          }
     
          public string doDirectPayment(){
         
                    try{
                        Http h = new Http();
                        HttpRequest req = new HttpRequest();
                      //String url = 'https://api-3t.sandbox.paypal.com/2.0/';
                        String url = 'https://api-3t.sandbox.paypal.com/2.0/';
                        string un = 'shailesh.gusain_api1.gmail.com'; // marchachange account username
                        string pw = '1407331231';  // merchant password
                        string sig = 'AZz2zkgg3..Hh096Lat2DuGGcNldADasFjkID3RTe3FMWBvYvGQmbwR-';  // marchange signature
                       
                       
                        String doDirectRequest;
                        doDirectRequest =  '<soap:Envelope xmlns:soap=' + '\"' + 'http://schemas.xmlsoap.org/soap/envelope/'  + '\"' + ' xmlns:xsi=' + '\"'+ 'http://www.w3.org/2001/XMLSchema-instance'  + '\"' + ' xmlns:xsd=' + '\"'+ 'http://www.w3.org/2001/XMLSchema' + '\"' + '>';
                        doDirectRequest += '<soap:Header><RequesterCredentials xmlns="urn:ebay:api:PayPalAPI"><Credentials xmlns="urn:ebay:apis:eBLBaseComponents">';
                        doDirectRequest += '<Username>' + un + '</Username><ebl:Password xmlns:ebl="urn:ebay:apis:eBLBaseComponents">' + pw;
                        doDirectRequest += '</ebl:Password><Signature>' + sig + '</Signature>';
                        doDirectRequest += '</Credentials></RequesterCredentials></soap:Header><soap:Body><DoDirectPaymentReq xmlns="urn:ebay:api:PayPalAPI">';
                        doDirectRequest += '<DoDirectPaymentRequest><Version xmlns="urn:ebay:apis:eBLBaseComponents">1.00</Version>';
                        doDirectRequest += '<DoDirectPaymentRequestDetails xmlns="urn:ebay:apis:eBLBaseComponents">';
                        doDirectRequest += '<PaymentAction>Sale</PaymentAction><PaymentDetails><OrderTotal currencyID="USD">' + amount + '</OrderTotal>';
                        doDirectRequest += '<ShipToAddress><Name>' + FirstName + ' ' + LastName + '</Name><Street1>' + Addy1 + '</Street1><Street2>' +Addy2 + '</Street2>';
                        doDirectRequest += '<CityName>' + city + '</CityName><StateOrProvince>' + state + '</StateOrProvince><PostalCode>' + zip + '</PostalCode>';
                        doDirectRequest += '<Country>' + country + '</Country></ShipToAddress>';
                        doDirectRequest += '</PaymentDetails><CreditCard><CreditCardType>' + selectedCardType+ '</CreditCardType><CreditCardNumber>' + CardNo + '</CreditCardNumber>';
                        doDirectRequest += '<ExpMonth>' + expMo + '</ExpMonth><ExpYear>' + expYe + '</ExpYear><CardOwner><PayerStatus>verified</PayerStatus>';
                        doDirectRequest += '<PayerName><FirstName>' + FirstName+ '</FirstName><LastName>' + LastName + '</LastName></PayerName><PayerCountry>' + country + '</PayerCountry>';
                        doDirectRequest += '<Address><Street1>' + Addy1 + '</Street1><Street2>' + Addy2 + '</Street2><CityName>' + city + '</CityName>';
                        doDirectRequest += '<StateOrProvince>' + state + '</StateOrProvince><Country>' + country + '</Country><PostalCode>' + zip + '</PostalCode></Address>';
                        doDirectRequest += '</CardOwner><CVV2>' + CVV + '</CVV2></CreditCard></DoDirectPaymentRequestDetails>';
                        doDirectRequest += '</DoDirectPaymentRequest></DoDirectPaymentReq></soap:Body></soap:Envelope>';
                        System.debug('---------------'+doDirectRequest );
                        req.setBody(doDirectRequest);
                       
                        req.setEndpoint(url);
                        req.setMethod('POST');
                        //req.setHeader('Content-length', '1753' );
                        //req.setHeader('Content-Type', 'application/xml');
                        //req.setHeader('SOAPAction','');
                        //req.setHeader('Host','api-aa.sandbox.paypal.com');
                        HttpResponse res = h.send(req);
                        System.debug('res ----------------------'+res.getBody());
                        String xml = res.getBody();
                        System.debug('xml----------------------'+xml);
                        rawResponse = xml;
                        system.debug(':!!!!!!!!!!!!!!!!!!!!!!:' + rawResponse);
                        XmlStreamReader reader = res.getXmlStreamReader();
                       result = readXMLResponse(reader,'Ack');
                        reader = res.getXmlStreamReader();
                        err = readXMLResponse(reader, 'LongMessage');
                       
                        if (result == 'Success'){
                        
                        system.debug('@@@@@@@@@@@@@@@@@@@@@@');
                          reader = res.getXmlStreamReader();
                         transid = readXMLResponse(reader, 'TransactionID');
                          
                            }else
                                {
                          result = err;
                           }
                   }catch(Exception e){
                           ApexPages.addMessage(new ApexPages.Message(ApexPages.Severity.Error,'ERROR : '+e));
                           system.deBug('222222222' + e);
                       }
                   return result;
              }

             public String readXMLResponse(XmlStreamReader reader, String sxmltag){
                           string retValue; // Read through the XML
                           while(reader.hasNext())
                           {
                             if (reader.getEventType() == XmlTag.START_ELEMENT)
                             {
                               if (reader.getLocalName() == sxmltag) {
                                 reader.next();
                                 if (reader.getEventType() == XmlTag.characters)
                                 {
                                   retValue = reader.getText();
                                 }
                               }
                             }
                             reader.next();
                           }
                           return retValue;
              }
              
             private boolean validate(){
              system.debug('@@@@@@@@@@@@@@@' + transid );
                        boolean isvalid = true;
                        if(!isValid(amount)){
                            ApexPages.addmessage(new ApexPages.message(ApexPages.severity.Error, 'Required Field Missing: Amount')); 
                            isvalid = false;
                        }
                      
                        if(!isValid(expYe)){
                            ApexPages.addmessage(new ApexPages.message(ApexPages.severity.Error, 'Required Field Missing: Expiration Date')); 
                            isvalid = false;
                        }
                        
                        if(!isValid(expMo)){
                            ApexPages.addmessage(new ApexPages.message(ApexPages.severity.Error, 'Required Field Missing: Expiration Date')); 
                            isvalid = false;
                        }
                        
                        if(!isValid(cvv)){
                            ApexPages.addmessage(new ApexPages.message(ApexPages.severity.Error, 'Required Field Missing: CVV Number')); 
                            isvalid = false;
                        }
                        
                        if(!isValid(firstname)){
                            ApexPages.addmessage(new ApexPages.message(ApexPages.severity.Error, 'Required Field Missing: First Name')); 
                            isvalid = false;
                        }
                        if(!isValid(lastname)){
                            ApexPages.addmessage(new ApexPages.message(ApexPages.severity.Error, 'Required Field Missing: Last Name')); 
                            isvalid = false;
                        }
                        
                        if(!isValid(addy1)){
                            ApexPages.addmessage(new ApexPages.message(ApexPages.severity.Error, 'Required Field Missing: Address')); 
                            isvalid = false;
                        }
                        
                        if(!isValid(Country)){
                            ApexPages.addmessage(new ApexPages.message(ApexPages.severity.Error, 'Required Field Missing: Country')); 
                            isvalid = false;
                        }
                        
                        
                        if(!isValid(addy2)){
                            ApexPages.addmessage(new ApexPages.message(ApexPages.severity.Error, 'Required Field Missing: State')); 
                            isvalid = false;
                        }
                        if(!isValid(zip)){
                            ApexPages.addmessage(new ApexPages.message(ApexPages.severity.Error, 'Required Field Missing: Zip')); 
                            isvalid = false;
                        }
         
                        if(isValid && transid != null ){
                        System.debug('@@@@@@transid @@@@@@' + transid );
                         ApexPages.addmessage(new ApexPages.message(ApexPages.severity.Confirm, 'Your payment has been accepted successfuly and transcation id for this payment is: '+ transid));
                             isAllowed = false;
                        }
                        
                        else{
                        system.debug('<<<<<<<<<<<<<<<<<<' + transid );
                        ApexPages.addmessage(new ApexPages.message(ApexPages.severity.Error, ' '+result+ ' '  ));
                             isAllowed = false;
                        } 
                           
                        return isvalid;
                }
    
                private boolean isValid(string val){
                  return val == null ? false : val.trim().length() == 0 ? false: true;
            }
    }