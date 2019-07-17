public  class overExtCont{

    public Apexpages.StandardController controller; 
    public PageReference page; 
    public string id; 
    public Account acc; 
    
     
       public Boolean val { get; 
    set; }
   

 public overExtCont(ApexPages.StandardController stdController){
     // val = false;
      this.Controller = stdController;
      this.page = ApexPages.currentPage();
      this.acc = (Account)stdController.getrecord();
      this.id = page.getParameters().get('id');
 
 
    }
     public PageReference save() {
      
         val = true;
         this.controller.save();
          pageReference pg = new pageReference('/apex/Override?id=' + controller.getId());
        
     pg.setRedirect(true);

         return pg; 
         }
         
 
      }