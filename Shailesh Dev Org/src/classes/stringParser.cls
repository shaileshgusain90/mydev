public class stringParser{
    public static string jsonStr ;
    public String nameFile {get;set;}
    public blob contentFile{get;set;}
    public class ContactsWrapper
      {
      public String firstName;
      public String lastName;
      }

      public stringParser(){
    //    parseJSONString();
        //parse();
        }

        
    public void parse(){   
        try{
        jsonStr =contentFile.toString();
        system.debug(';;;;;;;;;'+jsonStr );     
            ContactsWrapper c = (ContactsWrapper)JSON.deserialize(jsonStr , ContactsWrapper.class);
            system.debug('!!!!!!!!!!!!!!!!' + c);
            System.assertEquals(c.firstName, 'John');
            System.assertEquals(c.lastName, 'Smith');
            //System.assertEquals(c.city, 'New York');
              contact co = new contact();
         co.Firstname = c.firstName;
           co.Lastname = c.lastName;
           insert co;
       system.debug('!!!!!!!!!!!!!!' + co) ; 
         }catch(exception e){
             system.debug('!!!!!!!!!!!!!!!!!!!' + e);
         }
        }
        
     /*   public Pagereference ReadFile(){
        nameFile=contentFile.toString();
        return null; 
        } */
   }