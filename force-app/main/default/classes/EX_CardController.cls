public with sharing class EX_CardController {
    @AuraEnabled
    public static List<AccountListWrapper> getAccounts(){
        List<Account> accounts = [SELECT Id, Name, Start__c, Description__c, Status__c, Number__c FROM Account LIMIT 4];
        List<AccountListWrapper> wrappedAccounts = new List<AccountListWrapper>();
        if(!accounts.isEmpty()){
            for(Account acc : accounts){
                AccountListWrapper accWrapper = new AccountListWrapper();
                accWrapper.id = acc.id;
                accWrapper.name = acc.Name;
                accWrapper.start = acc.Start__c;
                accWrapper.department = acc.Description__c;
                accWrapper.status = acc.Status__c;
                accWrapper.nmbr = acc.Number__c;
                wrappedAccounts.add(accWrapper);
            }
        }
        return wrappedAccounts;
    }

    public class AccountListWrapper{
        @AuraEnabled
        public String id {get;set;}
        @AuraEnabled
        public String name {get;set;}
        @AuraEnabled
        public Date start {get;set;}
        @AuraEnabled
        public String department {get;set;}
        @AuraEnabled
        public String status {get;set;}
        @AuraEnabled
        public String nmbr {get;set;}
    }
}