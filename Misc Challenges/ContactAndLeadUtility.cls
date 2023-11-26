public class ContactAndLeadUtility {
	//helper class i created to quickly add some records for testing ContactAndLeadSearch.apxc
    public static void AddContactAndLeadRecord(String name){
        Contact contact = new Contact(LastName = name );
        insert contact;
        
        Lead lead = new Lead(LastName = name, Company = name + ' Company');
        insert lead;
    }
}