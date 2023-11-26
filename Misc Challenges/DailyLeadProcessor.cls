public with sharing class DailyLeadProcessor implements Schedulable {
    public void execute(SchedulableContext ctx){
        String leadSourceValue = 'Dreamforce';
        List<Lead> leads = [Select Id, LeadSource from Lead WHERE LeadSource = '' limit 200];
        for(Lead lead : leads){
            lead.LeadSource = leadSourceValue;
        }
        update leads;
    }
}
