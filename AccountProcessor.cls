public with sharing class AccountProcessor {
	@future
    public static void countContacts(List<Id> accountIds){
        List<Account> accounts = [Select ID, Name, (Select AccountId from Contacts) from Account where ID IN : accountIds] ;
        
        for(Account a : accounts){
    		a.Number_of_Contacts__c = a.Contacts.size();
		}
        update accounts;
    }
}

