public without sharing class CasePriority {  
    public static final string PriorityHigh = 'High';
    public static final string PriorityMedium = 'Medium';
    public static final string PriorityLow = 'Low';

    public static final string TypeVIP = 'VIP';
    public static final string TypeCustomer = 'Customer';
    public static final string TypeProspect = 'Prospect';

    public static string getCasePriority(string accountType) {
        if (String.IsBlank(accountType)) {
            return PriorityLow;
        }
        else if (TypeVIP.equalsIgnoreCase(accountType)) {
            return PriorityHigh;
        }
        else if (TypeCustomer.equalsIgnoreCase(accountType)) {
            return PriorityMedium;
        }
        else if (TypeProspect.equalsIgnoreCase(accountType)) {
            return PriorityLow;
        }
        else {
            return PriorityLow;
        }
    }

    public static void setCasePriority(List<Case> cases) {
        if (cases != null && cases.isEmpty() == false) {
            //Get Account Info
            Set<Id> accountIds = new Set<Id>();

            for (Case caseItem : cases) {
                if (caseItem.AccountId != null) 
                accountIds.add(caseItem.AccountId);
            }

            Map<Id, Account> accounts = new Map<Id, Account>([SELECT Id, Type FROM Account WHERE Id IN :accountIds]);

            //Set Priority
            for (Case caseItem : cases) {
                Id accountId = caseItem.AccountId;

                string accountType = '';

                if (accountId != null && accounts.containsKey(accountId)) {
                    accountType = accounts.get(accountId).Type;
                }

                caseItem.Priority = getCasePriority(accountType);
            }
        }
    }

    public static void updateAccountCasePriority(List<Account> accounts, Map<Id,Account> oldMap) {
        if (accounts != null && accounts.isEmpty() == false) {
            //Identified Modified Accounts
            List<Id> modifiedAccountIds = new List<Id>();

            for (Account acct : accounts) {
                string originalType = '';

                if (oldMap != null && oldMap.containsKey(acct.Id)) {
                    originalType = oldMap.get(acct.Id).Type;
                }

                if (originalType != acct.Type) {
                    modifiedAccountIds.add(acct.Id);
                }
            }

            //Get Account Cases
            List<Case> casesToUpdate = new List<Case>();

            List<Case> cases = [SELECT Id, Priority, Account.Type FROM Case WHERE AccountId IN :modifiedAccountIds];
            for(Case caseItem : cases) {
                string casePriority = String.IsBlank(caseItem.Priority) ? '' : caseItem.Priority;
                string acctPriority = getCasePriority(caseItem.Account.Type);

                if (acctPriority.equalsIgnoreCase(casePriority) == false) {
                    caseItem.Priority = acctPriority;
                    casesToUpdate.add(caseItem);
                }
            }

            //Update Cases
            if (casesToUpdate.isEmpty() == false) {
                update casesToUpdate;
            }
        }
    }
}