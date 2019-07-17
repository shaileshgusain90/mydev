public class Adwords{
 
 public string code;
 public string code2 = '4/9g-7Wuj7DSccxgBAxXu-AnKbXWPG.Au9uhbHcFgYdgrKXntQAax3SII8hjwI';
 //public string code3 = '4/MEJnZcXEUbfL7GN5C15vasjFJ4kn.UnEHXm8y8fEWBrG_bnfDxpIIH5QXjwI';
 //= '4/4XILFWVbQWnHvbk0AIXtWB2Ik61q.Unn7iAxNL38QgrKXntQAax3AoiAPjwI';
 public string key = '792205333799-c6q91ie3669mg4t3bpno3nvnqc06ubb7.apps.googleusercontent.com';
 public string secret = '3XYxy0dRH1M7xyR7-QYEznJT';
 public string redirect_uri = 'urn:ietf:wg:oauth:2.0:oob';

              
         
       public void setup(){
           
            Http h = new Http();
            HttpRequest req = new HttpRequest();
            req.setHeader('Authorization', 'Bearer ya29.UwADgbZPWAld5hwAAACDkbXpMv3S8T__GgpQDeNOyQbX0nOBU-iyncVZtJ4lzQ');
            req.setHeader('UserAgent', 'ReportDownloader:V7.18');
            req.setHeader('UserAgent', 'ReportDownloader:V7.18');
            req.setHeader('developerToken','S2modXljS41KHTFXw_2B5A');
            req.setHeader('clientCustomerId','149-265-5804');
           
            req.setTimeout(60*1000);
            req.setHeader('validateOnly','true');
            req.setHeader('partialFailure','true');
            req.setEndPoint('https://adwords.google.com/api/adwords/cm/v201406');
            req.setHeader('Content-Type', 'application/x-www-form-urlencoded');
            
            string xml='29';
           
           req.setBody('__rdxml='+EncodingUtil.urlEncode(xml, 'UTF-8'));
           req.setheader('content-length',String.valueOf(xml.length()));
           req.setMethod('POST');
            try{
            HttpResponse res= h.send(req);
            system.debug(res + 'ppppppppppppppppppppppppppppppppppp');
            system.debug('!!!!!!!!!!!!!' + res.getbody());
            }catch(exception ex){
            
            }
            } 
            
           
    private String accesstoken ;
    private  Integer expiresIn ;
    private String tokentype;

    public Adwords()
    {
        code = ApexPages.currentPage().getParameters().get('code') ;
        System.debug('----------------------------------------------------------------'+code);
        if(code != '' && code != null)
        {
            AccessToken() ;
        }
    }

    public PageReference DriveAuth()
    {    
        
        PageReference pg = new PageReference(GoogleDriveAuthUri (key , redirect_uri)) ;
        return pg ;
    }

    public String GoogleDriveAuthUri(String Clientkey,String redirect_uri)
    {
        String key = EncodingUtil.urlEncode(Clientkey,'UTF-8');
        String uri = EncodingUtil.urlEncode(redirect_uri,'UTF-8');
        String authuri = '';
        authuri = 'https://accounts.google.com/o/oauth2/auth?client_id='+key+'&response_type=code&scope=https%3A%2F%2Fadwords.google.com%2Fapi%2Fadwords%2F&redirect_uri='+redirect_uri+'&access_type=offline&approval_prompt=auto';
        system.debug('QqQqQqQqQqQqQqQqQqQqQ' + authuri);
        return authuri;
    }
            
     public void AccessToken()  
                            {  
        //Getting access token from google 
       // redirect_uri = encodingutil.urlEncode(redirect_uri, 'UTF-8'); 
      //  code = encodingutil.urlEncode(code , 'UTF-8'); 
     //   secret  = encodingutil.urlEncode(secret , 'UTF-8'); 
     //   key = encodingutil.urlEncode(key, 'UTF-8'); 
       
        HttpRequest req = new HttpRequest();  
        req.setMethod('POST');  
        req.setEndpoint('https://accounts.google.com/o/oauth2/token');
        //req.setEndpoint('https://accounts.google.com/o/oauth2/token?code='+code2+'&client_id='+key+'&client_secret='+secret+'&redirect_uri='+redirect_uri+'&grant_type=authorization_code');  
        //setHeader('code', code2);
        req.setHeader('content-type', 'application/x-www-form-urlencoded'); 
        //req.setHeader('client_id', key); 
        //req.setHeader('client_secret',secret); 
        //req.setHeader('redirect_uri', redirect_uri);
        //req.setHeader('grant_type', 'authorization_code');  
        // string messageBody = 'this is the string';
        
        String messageBody = 'code='+code2+'&client_id='+key+'&client_secret='+secret+'&redirect_uri='+redirect_uri+'&grant_type=authorization_code';  
        req.setHeader('Content-length', String.valueOf(messageBody.length()));  
       req.setBody(messageBody);  
        req.setTimeout(60*1000);  
  
        Http h = new Http();  
        String resp;  
        HttpResponse res = h.send(req);  
        resp = res.getBody();  
          
        System.debug(' json response ' + resp);  
       }
    }