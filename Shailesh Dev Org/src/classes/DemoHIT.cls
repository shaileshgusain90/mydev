public class DemoHIT {
  public DemoHIT(){
    
  }
 
  public string signature( string op, Datetime now, string securityKey) {
     String formattednow = now.formatGmt('yyyy-MM-dd')+'T'+now.formatGmt('HH:mm:ss')+'.'+now.formatGMT('SSS')+'Z';           
     String canonical = 'AWSMechanicalTurkRequester'+op+formattednow;
     Blob bsig = Crypto.generateMac('HmacSHA1', Blob.valueOf(canonical), Blob.valueOf(securityKey));          
     return EncodingUtil.base64Encode(bsig);
  }
        
   
  public PageReference CreateHITFromREST(){
   try{
     
     string titles = 'can you see the name plate';
      string AWSAccessKeyId = 'AKIAI7ZKI5FYOTKOTOHQ';
      string SecretAccessKey  = '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';
      string op = 'GetAccountBalance';
      DateTime Timestamp = system.now();
      String Signature = signature(op, Timestamp, SecretAccessKey);
      
      String formattednow = Timestamp.formatGmt('yyyy-MM-dd')+'T'+Timestamp.formatGmt('HH:mm:ss')+'.'+Timestamp.formatGMT('SSS')+'Z';           
        
      string ques = '<Question><QuestionIdentifier>my_question_id</QuestionIdentifier><DisplayName>My Question</DisplayName><IsRequired>true</IsRequired><QuestionContent>can you see the mane plate</QuestionContent><AnswerSpecification>can you it?</AnswerSpecification></Question>';
      ques = EncodingUtil.urlEncode(ques,'UTF-8');   
      Signature =  EncodingUtil.urlEncode(Signature,'UTF-8');
      titles = EncodingUtil.urlEncode(titles ,'UTF-8');
          
      string url = 'http://mechanicalturk.amazonaws.com/onca/soap?Service=AWSMechanicalTurkRequester&AWSAccessKeyId=' + AWSAccessKeyId + '&Version=2008-08-02&Operation=CreateHIT&Signature=' + Signature + '&Timestamp=' + formattednow +titles  + ques + '&AssignmentDurationInSeconds=30&LifetimeInSeconds=604800&Keywords=location,%20photograph,%20image,%20identification,%20opinion' ;     
       


      Http h = new Http();
      HttpRequest req = new HttpRequest();
      req.setEndpoint(url);
      req.setHeader('Content-Type', 'text/xml;charset=utf-8');
      req.setHeader('Content-Length', '5000');
      req.setMethod('GET');

      HttpResponse res = h.send(req);
      system.debug('-------------body---');
      System.debug(res.getBody());
      system.debug('----------------'+ res.getBody());

     }
   catch(exception ex){
    ApexPages.addMessage(new ApexPages.Message(ApexPages.Severity.WARNING,ex.getMessage()));
   }
   return null;
  }
    
}