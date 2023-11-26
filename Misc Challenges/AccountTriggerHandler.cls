public with sharing class AccountTriggerHandler {
    public static void CreateAccounts(List<Account> accounts){
        for (Account account : accounts){
            //ensure shipping state is same as billing state
            account.ShippingState = account.BillingState;
        }
    }
}
