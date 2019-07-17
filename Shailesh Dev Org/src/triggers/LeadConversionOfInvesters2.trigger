//Trigger name :- LeadConversionOfInvesters
//Description  :- trigger will convert the leads to Contacts/Person Accounts Automatically based on lead's recordtype and investment assosiated with it.
//Created by   :- Krishna Bhatt
//created Date :- 24-12-2014       

/******************************************/

trigger LeadConversionOfInvesters2 on Investment__c (after insert) {
    
     /******************************************/
       //Querying record type to get account of Recordtype : "Investor"
     /******************************************/
 
  /*  RecordType RecordTypeId = [SELECT id,Name
                               FROM   RecordType
                               WHERE  sobjectType='Account' 
                               AND    Name='Investor' 
                               limit  1]; */
                                
     
     //id list
     set<id> invIdList = new set<id>();
    
     //list of investobject
     list<Investment__c> investmentObjList = new list<Investment__c>();
  
    //invoking trigger
     for(Investment__c investmentObj : trigger.new){
           invIdList.add(investmentObj.Lead__c);          
      }
    
      /******************************************/
      //SOQL query to get lead record type,name and name of investment from loan and its child  
      //relation with inner query.
      /******************************************/
     list<Lead> leadObjList = [SELECT id,name,
                                      RecordType.Name,Email,
                                     (select id,Investor_Entity__c,
                                      Investor__c,name 
                                      from investments__r)
                               FROM lead
                               where ID 
                               IN : invIdList];
                                        
     
     /******************************************/
      //SOQL query to get Master label from lead status to set the converted status 
      /******************************************/
     LeadStatus convertStatus = [SELECT Id, MasterLabel 
                                 FROM LeadStatus 
                                 WHERE IsConverted = true 
                                 limit 1];
    
   
     for(lead leadObj : leadObjList){
           
             //creating new Person Account if lead's record type is investor
             //if(leadObj.RecordType.Name == 'Investor' && leadObj.RecordType.Name !=null){
                
                        Account personAccountObj = new Account();
                        personAccountObj.Name = leadObj.name;        
                        //personAccountObj.PersonEmail = leadObj.email;
                        
                        
                     //   if(recordTypeid.name != null)
                     //   personAccountObj.RecordTypeid = recordTypeid.id;
                                            
                        //converting lead to Account and contact    
                        Database.LeadConvert lc = new database.LeadConvert();
                        
                        lc.setLeadId(leadObj.id);
                        
                        //setting to not convert lead into opportunity 
                        lc.setDoNotCreateOpportunity(true);
                        
                        lc.setConvertedStatus(convertStatus.MasterLabel);
                        Database.LeadConvertResult lcr = Database.convertLead(lc);
                
             
                        //if lead conversion status is successful
                        if(lcr.isSuccess()){
                       
                             for(Investment__c investment : leadObj.Investments__r){
                                 investment.Investor_Entity__c = lcr.getContactId();  
                                 investment.Investor__c =  lcr.getAccountId();                     
                                 investmentObjList.add(investment); 
                     }
                }
          //  }
        }
        
        //updating list
     update investmentObjList;
 }