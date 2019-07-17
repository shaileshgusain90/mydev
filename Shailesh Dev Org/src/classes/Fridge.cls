public class Fridge{
    
    private String ModelNum;
    private Integer NumInStock;
    
    
     public  void SetModelNum(String theModelNum){
        
     ModelNum =    theModelNum;
        
    }
    
    public String getModelNum(){
        
     Return ModelNum; 
    }
    
    public void updateStock(Integer justSold){
        
        numInStock = NumInStock - justSold;
    }
}