public class leadT{
    
    public String FirstName{
     get;
        set;
    }
    public String LastName{
     get;
        set; 
        }
    public String CompanyName{
     get;
        set;
        
    }
    public String Email{
    get;
        set;
    }
    public list<Lead> ld{
    
    set;
    }
    public list<lead> getLead(){
      list<Lead> ld = [select FirstName,LastName,Company,phone from Lead];
            return ld;
    } 
    
    public pageReference save(){
    lead ld2 = new Lead();
        ld2.FirstName =Firstname;
        Ld2.lastName = LastName;
        ld2.Company = companyName;
        ld2.Email = Email;
        insert ld2;
       //return null;
       pageReference pk = new PageReference('/00Q/o');
       
    pk.setRedirect(true);
    return pk;
    }
  }