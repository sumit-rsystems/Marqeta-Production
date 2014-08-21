@istest(seealldata = true)
class OppTriggerTestClass
{
    private static testmethod void oppTriggTestmethod()
    {
       
        Account acc = new Account();
        acc.name = 'Test Account';
        insert acc;
        
        
        AccountUserRole__c asr = new  AccountUserRole__c();
        asr.account__c = acc.id;
        asr.user__c = UserInfo.getUserID();
        asr.role__c = 'Marketing';
        insert asr;
        
        AccountUserRole__c asr1 = new  AccountUserRole__c();
        asr1.account__c = acc.id;
        asr1.user__c = UserInfo.getUserID();
        asr1.role__c = 'Relationship Manager';
        insert asr1;
        
        AccountUserRole__c asr2 = new  AccountUserRole__c();
        asr2.account__c = acc.id;
        asr2.user__c = UserInfo.getUserID();
        asr2.role__c = 'Partner Services';
        insert asr2;
        
        
            Opportunity opp = new Opportunity();
            opp.name = 'Test opp';
            opp.stageName = '4-Closed Won';
            opp.closeDate = System.now().date();
            opp.accountID = acc.id;
            insert opp;
            
        
    }
}