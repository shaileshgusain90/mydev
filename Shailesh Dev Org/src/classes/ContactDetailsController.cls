public class ContactDetailsController 
   {

    public list<Contact> Contact
    {
  set;
     }
 
 
  //For the Recent Contacts
    public list<Contact> getContact(){
        list< Contact > con1 = new  list< Contact >();
     
          con1 = [SELECT Id,Name,Email,phone FROM Contact order by CreatedDate desc limit 5];
  
         return con1;
        }
        
     public  id aList
       {
     get;
     set;
       }
          
        public Contact Con = new Contact();//instance of contact
       
       
       
       //list for populating contact
         public List<selectoption>options
          {
        set;
         }
      
        public String cName
       {
     get;
     set;
        }
            public String phone 
                {
                   get;
                  set;
                 
                 }
                
          public String Email
          {
         get;
         set;
              }
     public List<selectoption> getOptions(){
   List<selectOption> options = new List<selectOption>(); 
   options.add(new selectoption('-None-','-None-'));
   
  // list<Account> account = new List<Account>();
   
   for(Account acc :[SELECT Id,Name FROM Account]){
    options.add(new selectOption(acc.id, acc.Name));
   
   
   }
   return options;
    }


//Saving Contacts
  public pageReference save(){
   Con.LastName = cName;
      //con.lastname='abc';
    //account accn=[select id,name from account where id =:Alist];
      Con.phone = phone;
       Con.Email = Email;
    Con.AccountId = Alist;
      upsert Con;
 
 
 //to Send Single Email to the contact
 
   /*String sub = 'Regarding new Contact';
    String[] add = new String[]{con.Email};
     String msg = 'hello' +'' +con.Lastname+' '+'your Contactno is formed and your email'+' '+con.Email+' '+'and phone no'+' '+con.phone;
      Messaging.SingleEmailMessage message = new Messaging.SingleEmailMessage();
       Message.setSubject(sub);
        message.setToAddresses(add);
         message.setPlainTextBody(msg);
       messaging.sendEmail(new Messaging.SingleEmailMessage[]{message}); */

   return null;
   } 
   }