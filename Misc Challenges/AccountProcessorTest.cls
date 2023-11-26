@IsTest
public class AccountProcessorTest {
    @IsTest
    private static void testCountContacts() {
        
        //ARRANGE
        
        //Create Contacts
        List<Contact> contacts = [Select Id from Contact];
        //System.assertEquals(contacts.size(),0);
        //System.debug('initial contact size: ' + contacts.size());
        
        for (Integer i = 0; i <= 9; i++){
            String firstname = 'Bubba' + i;
            String lastname = 'Smith';
            Contact c = new Contact();
            c.Email = firstname + '.' + lastname + '@gmail.com';
            c.FirstName = firstname;
            c.LastName = lastname;
            contacts.add(c);
        }
        insert contacts;
        //System.assertEquals(contacts.size(),10);
        
        //Create Accounts
        List<Account> newAcctList = new List<Account>();
        for (Integer i = 0; i <= 4; i++){
            Account a = new Account();
            a.Name = 'Company' + i;
			newAcctList.add(a);
        }
        insert newAcctList;
        //System.assertEquals(newAcctList.size(),5);
        
        //Associate Contacts to Accounts
        contacts = [Select Id, AccountId from Contact];
        newAcctList = [Select Id from Account];
        
        contacts[0].AccountId = newAcctList[0].Id;
        contacts[1].AccountId = newAcctList[0].Id;
        contacts[2].AccountId = newAcctList[1].Id;
        contacts[3].AccountId = newAcctList[1].Id;
        contacts[4].AccountId = newAcctList[2].Id;
        contacts[5].AccountId = newAcctList[2].Id;
        contacts[6].AccountId = newAcctList[3].Id;
        contacts[7].AccountId = newAcctList[3].Id;
        contacts[8].AccountId = newAcctList[4].Id;
        contacts[9].AccountId = newAcctList[4].Id;
        
        update contacts;
        
        //List<Account> accounts = [Select ID, Name, (Select AccountId from Contacts) from Account] ;
		//Integer contactsCount = accounts[0].Contacts.size();
        //System.assertEquals(2,contactsCount);
                        
        //ACT
        Test.startTest();
        List<ID> accountIds = new List<ID>();
        for(Account a : [select id from Account]){
            accountIds.add(a.id);
        }
        AccountProcessor.countContacts(accountIds);
        Test.stopTest();
        
        //ASSERT
        List<Account> accounts = [Select ID, Name, Number_of_Contacts__c, (Select AccountId from Contacts) from Account where ID IN : accountIds] ;
        for(Account a : accounts){
            Integer numContactsSize = a.Number_of_Contacts__c.intValue();
            Integer contactsCount = a.Contacts.size();
            System.assertEquals(numContactsSize, contactsCount);
        }
    }
}

