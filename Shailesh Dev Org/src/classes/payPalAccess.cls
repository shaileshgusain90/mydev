public class payPalAccess{
  
    public string clientId ='AS0HoRAJeFOfrhClOlRwFJ0cMJzdQk5ymgr0HoYC-y_A8ABRl-xj0DtY2pxd';
    public string secret = 'EMpcLxBJ6qR9ElmKZ0DGLy5ZDEXAFubnm0hwKGr7SJRgVtOwtvB2CV55B1jX';

  
  public void Authentication(){
  
            Http h = new Http();
            HttpRequest req = new HttpRequest();
            req.setHeader('Accept-Language', 'en_US');
            req.setHeader('Accept', 'application/json');
            req.setHeader('Authorization','AS0HoRAJeFOfrhClOlRwFJ0cMJzdQk5ymgr0HoYC-y_A8ABRl-xj0DtY2pxd:EMpcLxBJ6qR9ElmKZ0DGLy5ZDEXAFubnm0hwKGr7SJRgVtOwtvB2CV55B1jX');
            req.setHeader('grant_type','client_credentials');
            req.setTimeout(60*1000);
           // string body = '{"grant_type":"client_credentials"}';
            req.setHeader('Content-Type', 'application/x-www-form-urlencoded');
             req.setEndPoint('https://api.sandbox.paypal.com/v1/oauth2/token');
             //req.setbody(body);
             req.setMethod('POST');
              
                 try{
            HttpResponse res= h.send(req);
            system.debug(res + 'ppppppppppppppppppppppppppppppppppp');
            system.debug('!!!!!!!!!!!!!' + res.getbody());
            }catch(exception ex){
            
            }
         
         }
      }