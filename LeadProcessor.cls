public with sharing class LeadProcessor implements Database.Batchable<sObject>, Database.Stateful {
    
	public final String query = 'SELECT Id, LeadSource FROM Lead';
    public Integer recordsProcessed = 0;
    
    public Database.QueryLocator start(Database.BatchableContext BC){
        return Database.getQueryLocator(query);
    }
        
        
    public void execute(Database.BatchableContext BC, List<Lead> scope){
        // process each batch of records
        List<Lead> leads = new List<Lead>();
        for(Lead lead : scope){
            lead.LeadSource = 'Dreamforce';
            leads.add(lead);
        }
        update leads;
    }
    
    
    public void finish(Database.BatchableContext bc){
        // execute any post-processing operations
        System.debug(recordsProcessed + ' records processed. Booyah!');
        AsyncApexJob job = [SELECT Id, Status, NumberOfErrors,
            JobItemsProcessed,
            TotalJobItems, CreatedBy.Email
            FROM AsyncApexJob
            WHERE Id = :bc.getJobId()];
        System.debug('JOB INFO:  ' + job);
    }
}
