public class greeting{
    
    public Account acc;
    
    
    public greeting(Apexpages.StandardController stdCon){
        
     this.acc = (Account)stdCon.getRecord();   
        
        
    }
    
    public string getGreeting(){
        return 'hello' + acc.Name + '('+acc.id+') ' ;
        
    
    
    }
}