public class aggregateclass{
    integer empnumber;
    
    
    
    public integer getfun(){
        
        
LIST<AggregateResult> noOfEmployees = new LIST<AggregateResult> (); 
noOfEmployees = [SELECT COUNT(id) noOfEmp FROM Employee__c WHERE salary__c > 25000 ]; 
        for(AggregateResult sobj : noOfEmployees)
{   
     empNumber = Integer.valueOf(sobj.get('noOfEmp'));
 
}
return empnumber;
    }
}