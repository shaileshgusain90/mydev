trigger NewOpp on Account (after insert) {
    
    List<opportunity> ListOpp = new List<opportunity>();
    
    for(Account oAccount : Trigger.new){
     Opportunity opp = new Opportunity();
        opp.Name = oAccount.Name;
        opp.AccountId = oAccount.Id;
        opp.StageName = 'proposal';
        opp.CloseDate = system.today()+30;
        listOpp.add(opp);
        
    }
    
    if(Listopp.isEmpty()==false){
     database.insert(ListOpp);   
        
    }
}