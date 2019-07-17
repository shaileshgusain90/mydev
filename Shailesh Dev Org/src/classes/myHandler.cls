global class myHandler implements Messaging.InboundEmailHandler {

     public  Account acc;
      global Messaging.InboundEmailResult handleInboundEmail(Messaging.InboundEmail email, Messaging.InboundEnvelope envelope) {
        
          Messaging.InboundEmailResult result = new Messaging.InboundEmailresult();
          system.debug('!!!!!!!!!!!' + result);
          try{
              if([Select COUNT() from account where Name=:email.Subject]==0){
              Account account = new Account(); 
              account.Name = email.subject;
              insert account;
               system.debug('!!!!!!!!!!!!' + account);
              }
              
              else{
            acc = [Select ID from Account where Name =: email.subject];
             }
             
                 for(String address : email.ccAddresses){
                  Contact contact = new Contact();
                  Matcher matcher = Pattern.compile('<.+>').matcher(address);
                                  if (matcher.find()) {
                    String[] nameParts = address.split('[ ]*<.+>')[0].replace('"', '').split('[ ]+');
                   
                    contact.FirstName = nameParts.size() > 1 ? nameParts[0] : '';
                    contact.LastName = nameParts.size() > 1 ? nameParts[nameParts.size()-1] : nameParts[0];
                    contact.Email = matcher.group().replaceAll('[<>]', '');
                  } else {
                    contact.LastName = address;
                    contact.Email = address;
                  }
                 
                  // Add if new
                  if ([select count() from Contact where Email = :contact.Email] == 0) {
                    contact.AccountId = string.valueof(account.Id);
                    insert contact;
                    system.debug('!!!!!!!!!!!!' + contact);
                  }
             
                 }
              for (Messaging.Inboundemail.TextAttachment tAttachment : email.textAttachments) {
                                  Attachment attachment = new Attachment();
                                 
                                  attachment.Name = tAttachment.fileName;
                                  attachment.Body = Blob.valueOf(tAttachment.body);
                                  attachment.ParentId = string.valueof(account.Id);
                                  insert attachment;
                                }
                                for (Messaging.Inboundemail.BinaryAttachment bAttachment : email.binaryAttachments) {
                                  Attachment attachment = new Attachment();
                                 
                                  attachment.Name = bAttachment.fileName;
                                  attachment.Body = bAttachment.body;
                                  attachment.ParentId = string.valueof(account.Id);
                                  insert attachment;
                                  system.debug(Attachment + '!!!!!!!!!!!!!!!!!!!!!');
                                }
                                 Note note = new Note();

                            note.Title = email.fromName + ' (' + DateTime.now() + ')';
                            note.Body = email.plainTextBody;
                            note.ParentId = string.valueOf(account.Id);
                            insert note;
               
                             result.success = true;
                             }catch (Exception e) {
                              result.success = false;
                              result.message = 'Oops, I failed.';
                                }
                                 return result;
                            }
         
      }