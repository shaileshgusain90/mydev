public class MyCont {

    public String getName(){
     return 'MyCont';
     }
     
     public Account getAccount(){
       return[select id,name from Account where id = : Apexpages.currentpage().getParameters().get('id')];
      
     }
    
    
    


}