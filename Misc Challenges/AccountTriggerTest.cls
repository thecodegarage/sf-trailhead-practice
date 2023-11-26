@isTest
private class AccountTriggerTest {
    @isTest static void TestCreateNewAccountInBulk() {
        // Test Setup data
        // Create 200 new Accounts
        List<Account> accts = new List<Account>();
        for(Integer i=0; i < 200; i++) {
            Account acct = new Account(Name='Test Account ' + i);
            acct.BillingState = 'CA';
            accts.add(acct);
        }              
        // Perform Test
        Test.startTest();
        insert accts;                               
        Test.stopTest();
        // Verify that 200 new Accounts were inserted
        List<Account> verifyAccts = [SELECT Id, ShippingState FROM Account];
        System.assertEquals(200, verifyAccts.size());    
        // Also verify that all accounts have ShippingState = 'CA'
        for (Account account : verifyAccts){
            System.assertEquals('CA', account.ShippingState);
        }                            
                                     
    }
}
