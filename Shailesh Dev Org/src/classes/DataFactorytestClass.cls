@isTest
    public with sharing class DataFactorytestClass {
	
		   static Account acc;
	       //test method
		   public static testMethod void createAccounttest(){
				
				acc = DataFactoryclass.createAccounts(1)[0];
				insert acc;
				acc = [select id,name,phone,website from Account where id =: acc.id];
				system.assertEquals(acc.name,'shailesh');
				system.assertEquals(acc.phone,'9989889');
				system.assertEquals(acc.website,'www.google.com');		
		 }
    }