public class ContactSearch {

    public static List<Contact> searchForContacts(String lastName, String mailingPostalCode){  
        List<Contact> matchingContacts = [SELECT ID, Name FROM Contact
                                          WHERE (LastName =:lastName AND MailingPostalCode =:mailingPostalCode)
                                         ORDER By Name];
        System.debug(matchingContacts.size() + ' contacts returned.');
        return matchingContacts;
    }
}