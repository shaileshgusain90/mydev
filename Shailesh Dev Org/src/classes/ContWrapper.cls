public class ContWrapper
   {
   
  public  list<contactWrapper> conList{get;set;}
  public boolean DeteteWrap{get;set;}
  public id contid{get;set;}
  public ContWrapper(){
  
  DeteteWrap=false;
  
  }
   
    public   list<contactWrapper> getcont(){
    
   conList = new List<contactWrapper>();
for(Contact cn: [select Id, Name, Email, Phone,AccountId from Contact limit 5])
conList.add(new Contactwrapper(cn));
return ConList;
    
    
    
    }
    
    public pageReference DeleteCont()
    {
    
    system.debug('#################' + conList);
    contact delcon = new Contact(id=contId);
    
    
    
    return null;
    
    }
   
   
   public class contactWrapper{
   
   public contact con{get;set;}
   public boolean selectCon{get;set;}
   
   public contactWrapper(contact c){
   
   con = c;
   selectCon = false;
   
   
   }
   }
   }