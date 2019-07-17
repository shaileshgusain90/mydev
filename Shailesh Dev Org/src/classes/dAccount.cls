public class dAccount{

    public pageReference page;
    public String id; 
    public Account ac;
    public Apexpages.StandardController controller; 
    
    public boolean AccVal{
    get;
    set;
    
    }
    
   public dAccount(ApexPages.standardController stdController){
    
       this.Controller = stdController;
       this.page = ApexPages.currentPage();
       this.id = page.getParameters().get('id');
       this.ac = (Account)stdController.getrecord();
       
       
       }
    
    public pageReference save(){
     
     AccVal = true;
    this.controller.save();
      pageReference p1 = new pageReference('/apex/DetailAccount?id=' + controller.getid());
        
     p1.setRedirect(true);
    return p1;
    
       }
       
       
      public pageReference del(){
      
     //Account acc = [Select id from Account where id =:apexPages.currentpage().getparameters().get('id')];
     this.controller.delete();
      pageReference p2 = new pageReference('/apex/AccountOverview');
        
     p2.setRedirect(true);
    return p2;
    
       } 
       
    }