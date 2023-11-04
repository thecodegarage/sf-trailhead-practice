@IsTest
public class AddPrimaryContactTest {

    @testSetup
    static void setup(){
        //insert 50 Account records for for BillingState NY 
        //and 50 Account records for BillingState CA

        List<Account> accounts = new List<Account>();
        
        for(integer i = 0; i < 50; i++){
            Account ny = new Account(Name = 'accountNameNY' + i, BillingState = 'NY');
            accounts.add(ny);
            Account ca = new Account(Name = 'accountNameCA' + i, BillingState = 'CA');
            accounts.add(ca);
        }
        insert accounts;
        
    }
    static testmethod void testAddPrimaryContact(){
        Contact c = new Contact(FirstName = 'Ken', LastName = 'Doll');
        String state = 'CA';
        AddPrimaryContact apc = new AddPrimaryContact(c,state);
        
        Test.startTest();
        System.enqueueJob(apc);
        Test.stopTest();
        
        List<Account> accounts = [Select Id, (Select AccountId from Contacts) FROM Account WHERE BillingState = : state]; 
        for (Account a : accounts){
            System.assertEquals(a.Id, a.Contacts[0].AccountId);
        }
    }
}
