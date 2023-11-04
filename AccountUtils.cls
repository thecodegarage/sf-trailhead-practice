public with sharing class AccountUtils  {
    public static List<Account> accountsByState (String state){
        
        
        List<Account> accounts = new List<Account>([SELECT Id, Name FROM Account where BillingState = :state]);

        return accounts;
    }
}