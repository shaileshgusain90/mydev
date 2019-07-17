public class HelloController {
  public HelloController() {}
 

  public String getName() {
   
    String name = 'shailesh';
    
    String fromPhone = ApexPages.currentPage().getParameters().get('From');
    if (fromPhone!=null) {
    
      if (fromPhone.startsWith('+1'))
        fromPhone = fromPhone.substring(2);
    
      // search Lead and Contact phone number fields
      List<List<SObject>> results = [FIND :fromPhone IN Phone FIELDS
          RETURNING Contact(FirstName, LastName), Lead(FirstName, LastName)
          LIMIT 1];
    
      // extract the name if there’s a match
      if (!results[0].isEmpty()) {
        Contact r = (Contact)results[0][0];
        name = r.firstName + ' ' + r.lastName;
      } else if (!results[1].isEmpty()) {
        Lead r = (Lead)results[1][0];
        name = r.firstName + ' ' + r.lastName;
      }
    }
    return name;
  }
 
}