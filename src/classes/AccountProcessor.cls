public class AccountProcessor {

    @Future(Callout=true)
    public static void countContacts(List<Id> acctIds) {
        List<Account> accounts = [SELECT Id, Number_of_Contacts__c, (SELECT Id From Contacts) FROM Account WHERE Id IN:acctIds];

        if(!accounts.isEmpty()){
            for(Account acct : accounts){
                acct.Number_of_Contacts__c = acct.Contacts.size();
            }

            update accounts;
        }


    }
}