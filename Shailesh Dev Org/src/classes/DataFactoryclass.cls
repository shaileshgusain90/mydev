public with  sharing abstract class DataFactoryclass {

      //creating Account
	  public static list<account> createAccounts(integer noOfaccount){
	    
	    list<Account> act = new list<Account>();
	      for(integer i=0 ; i<noOfaccount ; i++){
	       
	        Account acc = new Account( name = 'Test Account'+math.random(),phone = '9898888',website='www.rockfort.com');
	      
	      	   act.Add(acc);
	      }
	      return act;
	   }

    }