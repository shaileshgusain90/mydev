trigger updateContact on Account (after insert,after update) {


if(trigger.isInsert){ 

        
        for(Account acc : trigger.new){

        Contact c = new Contact(LastName = acc.name,
                        AccountId=acc.id,
                        Fax=acc.Fax,
                        MailingStreet=acc.BillingStreet,
                        MailingCity=acc.BillingCity,
                        MailingState=acc.BillingState,
                        MailingPostalCode=acc.BillingPostalCode,
                        MailingCountry=acc.BillingCountry,
                        Phone=acc.Phone);

                   insert c;
                  
                  }
                  
               if(trigger.isUpdate){
               
               for(Account ac : trigger.new){
               
               list<contact> cp = new List<contact>();
                           cp = [select id ,lastName from contact where id =:Ac.id];
                           
                      update cp;
                      
               
                  }
                  
                   }
            }
        }