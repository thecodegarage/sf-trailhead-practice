@IsTest
public class DailyLeadProcessorTest {
    public static String CRON_EXP = '0 0 0 15 3 ? 2042';
    
    @IsTest
    private static void testDailyLeadProcessor(){
        integer newLeadCnt = 200;
        List<Lead> leads = new List<Lead>();
        for (integer x = 0; x < newLeadCnt; x++){
            leads.add(new Lead(FirstName = 'firstname' + x, LastName = 'lastname' + x, Company = 'Company' + x));
        }
        insert leads;
        
        // Get the IDs of the Leads we just inserted
        Map<Id, Lead> leadMap = new Map<Id, Lead>(leads);
        List<Id> leadIds = new List<Id>(leadMap.keySet());
        
        Test.startTest();
        string jobId = System.schedule('ScheduledApexTest', CRON_EXP, new DailyLeadProcessor());
        List<Task> lt = [Select Id FROM Task WHERE WhatId IN :leadIds];
        System.assertEquals(0, lt.size(), 'Tasks exist before job has run');
        Test.stopTest();
        
        //May not be possible to do this assertion - if these are run synchronously in Unit tests ??
        //lt = [Select Id from Task WHERE WhatId IN :leadIds]; 
        //System.assertEquals(leadIds.size(), lt.size(), 'Tasks were not created');
        
        List<Lead> updatedLeads = [Select Id, LeadSource from Lead WHERE LeadSource = 'Dreamforce'];
        System.assertEquals(200, updatedLeads.size());
    }
}
