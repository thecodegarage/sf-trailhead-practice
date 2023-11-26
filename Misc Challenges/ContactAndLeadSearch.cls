public class ContactAndLeadSearch {

    public static List<List<sObject>> searchContactsAndLeads(String name){
        //List<List<sObject>> sObjectLists = new List<List<sObject>>();
        
        List<List<SObject>> sObjectLists = [FIND :name IN ALL FIELDS 
                                      RETURNING Lead(FirstName,LastName), Contact(FirstName,LastName)];
        
        System.debug(sObjectLists.size() + ' records returned');
        System.debug(sObjectLists);
        
        return sObjectLists;
    }
}