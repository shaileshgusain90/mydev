trigger oneValues on Account (before insert,before update) 
       {
           
         for (Account Acc : trigger.new){
               
               if(acc.AccountNumber==null){
                    Acc.addError('No fuck off');                   
                   
               }
               
           }
       }