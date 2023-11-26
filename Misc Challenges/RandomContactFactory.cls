public class RandomContactFactory {

    public static List< Contact > generateRandomContacts(integer count, string lastName){
        
        List<Contact> newContacts = new List<Contact>();
        for (integer i = 0; i < count; i++){
            Contact c = new Contact(FirstName = 'Firstname' + i, LastName = lastName);
			newContacts.add(c);
        }
        return newContacts;
    }
}