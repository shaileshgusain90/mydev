global class mynewClass implements Messaging.InboundEmailHandler {
      global Messaging.InboundEmailResult handleInboundEmail(Messaging.InboundEmail email, Messaging.InboundEnvelope envelope) {
          Messaging.InboundEmailResult result = new Messaging.InboundEmailresult();
         
         //string emailText;
         system.debug('!!!!!!!!!!!!!!!!!!' + email.plainTextbody );
         
         string emailParse = email.plainTextbody;
          system.debug(emailParse+ emailParse.split('\n'));
        list<string> emailParse1 = emailParse.split('\n');
         system.debug('@@@@@@@@@@@@@@'+ emailParse1);
         leave_Application__c iva = new leave_Application__c();  
          for(string lva : emailParse1){
      
        
             if(lva.startswith('First Name')){
            string ab = lva.split(':')[1];
            iva.First_Name__c = ab;
            system.debug(ab +'ppppppppppppppp');
             }
              if(lva.startswith('Last Name')){
              string ba = lva.split(':')[1];
             iva.Last_Name__c = ba;
             system.debug(ba +'ppppppppppppppp');
             }
         
          if(lva.startswith('Leave type')){
          string lt = lva.split(':')[1];
          iva.Leave_Type__c = lt;
          system.debug(lt+'ppppppppppppppp');
             }
             
                 if(lva.startswith('Leave type')){
                 string lt = lva.split(':')[1];
                  iva.Leave_Type__c = lt;
                 system.debug(lt+'ppppppppppppppp');
             }
              if(lva.startswith('start date')){
              string lt = lva.split(':')[1];
              iva.Start_date__c = date.valueof(lt);
             system.debug(lt+'ppppppppppppppp');
             }
              if(lva.startswith('end date')){
              string ed = lva.split(':')[1];
              iva.End_Date__c = date.valueof(ed);
              system.debug(ed +'ppppppppppppppp');
             }
                if(lva.startswith('Reason')){
                string Re = lva.split(':')[1];
                iva.Reason__c = Re ;
                system.debug(Re + 'ppppppppppppppp');
             }
             
         }
         insert iva;
         
     /*         if([Select COUNT() from leave_Application__c  where Name=:email.plainTextBody]==0){
              leave_Application__c lva = new leave_Application__c(); 
              account.Name = email.plainTextBody;
              insert lva;
               system.debug('!!!!!!!!!!!!' + lva );
              } */
              
            
         
          return result;
      
  }
  
  }