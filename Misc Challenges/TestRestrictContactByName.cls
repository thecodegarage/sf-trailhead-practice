@isTest
public class TestRestrictContactByName {

    @isTest static void TestValidRestrictContactByName(){
       //Test Data Setup
       //Create Account with a contact with valid last name
       Contact c = new Contact(FirstName = 'Ken', LastName = 'Doll');
        
       //Perform Test
       Test.startTest();
       insert c;
       Test.stopTest();
       
       //Verify
       //Is contact in DB and retrievable?
       List<Contact> contacts = new List<Contact>();
       contacts = [Select Id FROM Contact WHERE FirstName = 'Ken' and LastName = 'Doll' Limit 1];
       System.assertEquals(1, contacts.size());
       
    }
    
    @isTest static void TestInValidRestrictContactByName(){
       //Test Data Setup
       //Create Account with a contact with valid last name
       Contact c = new Contact(FirstName = 'IAMAN', LastName = 'INVALIDNAME');
        
       //Perform Test
       Test.startTest();
        try{
            insert c;
        }
        catch(Exception e){
            //Do Nothing - we will simply assert if inserted
        }
       Test.stopTest();
       
       //Verify
       //Is contact in DB and retrievable?
       List<Contact> contacts = new List<Contact>();
       contacts = [Select Id FROM Contact WHERE FirstName = 'IAMAN' and LastName = 'INVALIDNAME' Limit 1];
       System.assertEquals(0, contacts.size());
       
    }
}
