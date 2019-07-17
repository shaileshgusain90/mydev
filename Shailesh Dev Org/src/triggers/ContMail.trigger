trigger ContMail on Contact (before insert) {
    
    Messaging.reserveSingleEmailCapacity(trigger.size);
    List<Messaging.SingleEmailMessage> emails = new List<Messaging.SingleEmailMessage>();
    
    for(Contact c : Trigger.new){
        Messaging.SingleEmailMessage email = new Messaging.SingleEmailMessage();   
             email.setToAddresses(new String[] {c.Email});
                //email.setReplyTo('shailesh.gusain@gmail.com');
                email.setSenderDisplayName('Gusain');
                email.setSubject('Subjected to Learning');
                email.setPlainTextBody('Your Account now created');
                emails.add(email);
            
        }
        Messaging.sendEmail(emails);
    }