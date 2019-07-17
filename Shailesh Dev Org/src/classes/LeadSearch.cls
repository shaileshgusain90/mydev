public class LeadSearch{

 

     
    public list<lead> results;
    String Searchtext;
    
    public string getSearchText(){
     return searchText;   
        
    }
      public void setSearchText(string s){
      searchText = s;   
         // return s;
        
    }
    
    public list<lead> getResults(){
     return results;   
        
    }
    public PageReference doSearch(){
    string str = searchText;
    
        results = [select name,email,phone from Lead where name like :'%'+str+'%'];
        return null;
    }
}