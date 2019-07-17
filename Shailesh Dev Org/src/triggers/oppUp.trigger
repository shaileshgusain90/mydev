trigger oppUp on Account (before update) {
    
    List<Opportunity> opp2 = new List<opportunity>();
    
    for(Account ac:trigger.new){
     Opportunity op = new Opportunity();
        op.Name = ac.Name;
        op.StageName ='Qalification';
        //op.add(op);
        op.AccountId = ac.Id;
        op.CloseDate= system.today()+10;
        opp2.add(op);
    
    
        database.insert(opp2);
}
}