public class ListController{

    public opportunity getOpportunities() {
        return null;
    }

    
    public apexPages.StandardSetController setCon{
        
        get{
            if(setCon==null){
                
                setCon =new apexpages.StandardSetController(database.getQueryLocator([SELECT id,name,CloseDate FROM Opportunity]));
            }
            return setCon;
        }
        
        set;
        
        
        
    }
    public list<Opportunity> getOpportunity(){
        
        return (List<Opportunity>) setCon.getRecords();
    }

}