public with sharing class AddPrimaryContact implements Queueable {
    
    private Contact contact;
    private String state;
    
    public AddPrimaryContact(Contact contact, String state){
        this.contact = contact;
        this.state = state;
    }
    
    public void execute(QueueableContext context){
        List<Account> accounts = new List<Account>();
        List<Contact> newContacts = new List<Contact>();
        accounts = [Select Id, BillingState FROM Account WHERE BillingState = :state Limit 200];
        for(Account a : accounts){
            if (a.BillingState == state){
                Contact c = contact.clone();
                c.AccountId = a.Id;
                newContacts.add(c);
            }            
        }
		insert newContacts;
        
        
        
    }
}
