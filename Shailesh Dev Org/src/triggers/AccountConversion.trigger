trigger AccountConversion on Lead (after insert) {
   
    
    for(lead md : trigger.new){
    


Database.LeadConvert lc = new Database.LeadConvert();
lc.setLeadId(md.id);
        

LeadStatus convertStatus = [SELECT Id, MasterLabel FROM LeadStatus WHERE IsConverted=true LIMIT 1];
lc.setConvertedStatus(convertStatus.MasterLabel);

Database.LeadConvertResult lcr = Database.convertLead(lc);
System.assert(lcr.isSuccess());
        
        if(lcr.isSuccess() == true){
           // lcr.getContactId();
            id cid= lcr.getcontactId();
             system.debug('@@@@@@@@@@@@@@' + cid);
            //pagereference pr= new pagereference('/'+cid);
            //pr.setredirect(true);
            pageRefer.redirection(cid);
          
            
    // pageRefer rf = new pageRefer();
            
      //     rf.redirection(); 
            
            
        }
       
}
    
}