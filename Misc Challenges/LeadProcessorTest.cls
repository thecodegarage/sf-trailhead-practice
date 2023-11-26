@IsTest
public class LeadProcessorTest {
    @testSetup
    static void setup(){
        //Arrange
		List<Lead> newLeads = new List<Lead>();
        for(Integer i = 0;i < 200; i++){
            Lead newLead = new Lead(lastname='Lastname' + i, company='company' + i);
            newLeads.add(newLead);
        }
        insert newLeads;
        
        //validating lead creation 
        //List<Lead> leads = [Select Id from Lead];
        //System.assertEquals(200, leads.size());
    }
	@IsTest
    static void TestLeadRecordsUpdate(){

        //Act
        Test.startTest();
        LeadProcessor lp = new LeadProcessor();
        Id batchId = Database.executeBatch(lp);
        Test.stopTest();
        
        //Assert
        List<Lead> leads = [Select Id, LeadSource from Lead where LeadSource = 'Dreamforce'];
        System.assertEquals(200, leads.size());
    }
}
