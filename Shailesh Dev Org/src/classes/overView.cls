public class overView{

  


   public string id; 
    public Account acc; 
   public PageReference page;

 public Apexpages.StandardController controller; 

 public overView(ApexPages.StandardsetController stdController){
    
     
 



  }

    public PageReference newA() {
   
    PageReference page = new PageReference('/apex/DetailAccount');
    page.setRedirect(true);
    return page;
  }


  }