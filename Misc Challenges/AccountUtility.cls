public with sharing class AccountUtility {
    public static void viewAnnualRevenue(){
        List<Account> accountsList = [Select Name, AnnualRevenue From Account];
        for (Account a : accountsList){
            String acctRev = a.Name + ' : ' +  a.AnnualRevenue;
            System.debug(acctRev);  
        }
    }
}

