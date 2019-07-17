trigger MyTrigger on Case (before insert) {
    
    String userId = '';
    Map<id,user> userMap= new Map<id,user>();
    Case cs =[select id,user_Assign__c from case ORDER BY user_Assign__c ASC LIMIT 1];

    if(Trigger.isInsert && Trigger.isBefore)
    {
        for(case c : Trigger.new)
        {
        List<User> us = userMap.values();
        userId = us[0].id;
        user up = userMap.get(userid);
//      up.Assign_Case__c++;
        userMap.put(userId,up);
        c.ownerId = userId;
        }
        update userMap.values();
    }
}