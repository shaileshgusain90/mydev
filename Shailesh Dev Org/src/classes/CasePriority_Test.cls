@isTest  
private class CasePriority_Test {

    static testMethod void testGetCasePriority() {
        //Start Test
      
        Test.startTest();
       try{
        string testNull = CasePriority.getCasePriority(null);
        string testVIP = CasePriority.getCasePriority(CasePriority.TypeVIP);
        string testCustomer = CasePriority.getCasePriority(CasePriority.TypeCustomer);
        string testProspect = CasePriority.getCasePriority(CasePriority.TypeProspect);
        string testUnknown = CasePriority.getCasePriority('Some Unknown Type');

        Test.stopTest();

        //Validate Test
        System.assertEquals(CasePriority.PriorityLow, testNull);
        System.assertEquals(CasePriority.PriorityHigh, testVIP);
        System.assertEquals(CasePriority.PriorityMedium, testCustomer);
        System.assertEquals(CasePriority.PriorityLow, testProspect);
        System.assertEquals(CasePriority.PriorityLow, testUnknown);
        }catch(exception e){
             System.Assert(e.getMessage().contains('FIELD_CUSTOM_VALIDATION_EXCEPTION'));
             //System.Assert(e.getMessage().contains('p'));
        }
    }

    static testMethod void testSetCasePriority() {
        //Setup Test
        Account testAccount = new Account();
        testAccount.Name = 'Test Account';
        testAccount.Type = CasePriority.TypeVIP;
        insert testAccount;

        Case testCase = new Case();
        testCase.AccountId = testAccount.Id;
        testCase.Priority = 'Low';
        insert testCase;

        //Start Test
        Test.startTest();
        try{
        CasePriority.setCasePriority(new List<Case>{ testCase });
          }catch(exception e){
             System.Assert(e.getMessage().contains('FIELD_CUSTOM_VALIDATION_EXCEPTION'));
          }
        Test.stopTest();

        //Validate Test
        System.assertEquals(CasePriority.PriorityHigh, testCase.Priority);
    }

    static testMethod void testUpdateAccountCasePriority() {
        //Setup Test
       try{
        Account testAccount = new Account();
        testAccount.Name = 'Test Account';
        testAccount.Type = CasePriority.TypeVIP;
        insert testAccount;

        Case testCase = new Case();
        testCase.AccountId = testAccount.Id;
        testCase.Priority = 'Low';
        insert testCase;

        Account testAccount2 = new Account(Id=testAccount.Id);
        testAccount2.Type = CasePriority.TypeCustomer;
        update testAccount2;

        Map<Id, Account> oldMap = new Map<Id, Account>{testAccount.Id => testAccount};

        //Start Test
        Test.startTest();
        
        CasePriority.updateAccountCasePriority(new List<Account>{ testAccount2 }, oldMap);

        Test.stopTest();

        //Validate Test
        Case caseResult = [SELECT Id, Priority FROM Case WHERE Id = :testCase.Id];
        System.assertEquals(CasePriority.PriorityMedium, caseResult.Priority);
        }catch(exception e){
         System.Assert(e.getMessage().contains('FIELD_CUSTOM_VALIDATION_EXCEPTION'));
         }
    }
}