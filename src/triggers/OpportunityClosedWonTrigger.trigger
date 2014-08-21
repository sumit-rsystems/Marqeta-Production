trigger OpportunityClosedWonTrigger on Opportunity (before insert, before Update) 
{
    Set<ID> sIDs = new Set<ID>();
  //  String UserProfile = Label.OpportunityUpdateProfile;
  //  String CurrentUserProfile = UserInfo.getProfileID();
  //  String temp = CurrentUserProfile.subString(0,(CurrentUserProfile.length() - 3)) ;
    
    for(Opportunity opp : Trigger.new)
    {
        System.debug('testing >>>>>>>>>>>>>>>' + opp.stageName);
        //  System.debug('testing >>>>UserProfile >>>>>>>>>>>' + UserProfile );
        // System.debug('testing >>>>>CurrentUserProfile >>>>>>>>>>' + temp );
       
       if(opp.StageName == '4-Closed Won' ) 
       {
       sIDs.add(opp.AccountID);
       }      
     /*  if((opp.StageName == '4-Closed Won' ) && (UserProfile.contains(temp) == false))
        {
              opp.addError('You cannnot change opportunity to Closed Won');
        }
        else
        {
            sIDs.add(opp.AccountID);
        }
        
      */
        
    }
    
    // System.debug('testing >>>>>>>>>>>>>>>' + opp.stageName);
    
    Map<ID, Account> map_ID_Acc = new Map<ID,Account>([SELECT id, name,ownerid FROM Account where id in :sIDS]); 
  
    Map<ID, AccountUserRole__c> map_ID_AUR = new Map<ID,AccountUserRole__c>([SELECT id, name, Account__c, user__c,Role__c FROM AccountUserRole__c where Account__c in :sIDS]); 
    
    Map<ID, List<AccountUserRole__c>> map_AccID_lCon = new Map<ID, List<AccountUserRole__c>>();
    for(AccountUserRole__c c : map_ID_Aur.values())
    {
        if(!map_AccID_lCon.containsKey(c.Account__c))
        {
            List<AccountUserRole__c> lCon = new List<AccountUserRole__c>();
            lCon.add(c);
            map_AccID_lCon.put(c.account__c,lCon);    
        }
        else
        {
            List<AccountUserRole__c> lCon = new List<AccountUserRole__c>();
            lCon = map_AccID_lCon.get(c.account__c);
            lCon.add(c);
            map_AccID_lCon.remove(c.account__c);    
            map_AccID_lCon.put(c.account__c,lCon);    
        }
    }
        
    
    
    List<Account> lAcc = new List<Account>();
    List<Task> lTask = new List<Task>();
    for(Opportunity opp : Trigger.new)
    {
        if(opp.StageName == '4-Closed Won')
        {
            Account acc = map_ID_Acc.get(opp.AccountID);
            if(acc != null)
            {
                acc.Average_Ticket_Size__c = opp.Average_Ticket_Size__c;
                acc.Current_Marketing_Activities__c = opp.Current_Marketing_Activities__c;
                acc.Discover_SMR__c = opp.Discover_SMR__c;
                acc.Email_Database_Size__c = opp.Email_Database_Size__c;
                acc.Email_Frequency__c = opp.Email_Frequency__c;
                acc.Email_Solution_Program__c = opp.Email_Solution_Program__c;
                acc.Marketing_Budget_Term__c = opp.Marketing_Budget_Term__c;
                acc.Marketing_Budget__c = opp.Marketing_Budget__c;
                acc.Target_Demographics__c = opp.Target_Demographics__c;
                acc.status__c = 'soon';
                lAcc.add(acc);
                
                List<AccountUserRole__c> lContact = new List<AccountUserRole__c>();
                lContact = map_AccID_lCon.get(acc.id);
               
                System.debug('>>>>>>>>>>>>>>>>>>>' + lContact);
               
                if(lContact != null)
                {
                    System.debug('>>>>>>>1>>>>>>>>>>>>' + lContact);
               
                    
                    for(AccountUserRole__c c : lContact)
                    {
                       if(c.User__c != null)
                       {
                        if((c.role__c ==  null))
                        {
                            opp.addError('Please assign role to internal assigned User');
                        }
                        else if(c.role__c ==  'Marketing')
                        {
                            Task t2 = new task();
                            t2.OwnerId = c.User__c;
                            t2.Subject = 'Create about us content';
                            t2.ActivityDate = system.today();
                          //  t2.whoid = c.id;
                            t2.WhatId = acc.id;
                            t2.Status = 'Not Started';
                            t2.priority = 'Normal';
                            t2.Description = 'Create about us content';
                            lTask.add(t2);
                        
                            
                            Task t21 = new task();
                            t21.OwnerId = c.User__c;
                            t21.Subject = 'Create social media content';
                            t21.ActivityDate = system.today();
                          //  t21.whoid = c.id;
                            t21.WhatId = acc.id;
                            t21.Status = 'Not Started';
                            t21.priority = 'Normal';
                            t21.Description = 'Create social media content';
                            lTask.add(t21);
                          
                            
                            Task t22 = new task();
                            t22.OwnerId = c.User__c;
                            t22.Subject = 'Update field labeled Twitter handle';
                            t22.ActivityDate = system.today();
                          //  t22.whoid = c.id;
                            t22.WhatId = acc.id;
                            t22.Status = 'Not Started';
                            t22.priority = 'Normal';
                            t22.Description = 'Update field labeled Twitter handle';
                            lTask.add(t22);
                            
                            Task t23 = new task();
                            t23.OwnerId = c.User__c;
                            t23.Subject = 'Update field facebook page';
                            t23.ActivityDate = system.today();
                          //  t23.whoid = c.id;
                            t23.WhatId = acc.id;
                            t23.Status = 'Not Started';
                            t23.priority = 'Normal';
                            t23.Description = 'Update field facebook page';
                     
                            lTask.add(t23);
                        }
                        else if(c.role__c ==  'Relationship Manager')
                        {
                            Task t2 = new task();
                            t2.OwnerId = c.User__c;
                            t2.Subject = 'Test swipe with merchant';
                            t2.ActivityDate = system.today();
                          //  t2.whoid = c.id;
                            t2.WhatId = acc.id;
                            t2.Status = 'Not Started';
                            t2.priority = 'Normal';
                            t2.Description = ' 1. Test Swipe with Merchant, to be done at each location participating';
                            lTask.add(t2);
                            
                            Task t21 = new task();
                            t21.OwnerId = c.User__c;
                            t21.Subject = 'Assess merchant to develop launch plan';
                            t21.ActivityDate = system.today();
                          //  t21.whoid = c.id;
                            t21.WhatId = acc.id;
                            t21.Status = 'Not Started';
                            t21.priority = 'Normal';
                            t21.Description = 'Assess merchant to develop launch plan';
                            lTask.add(t21);
                            
                        }
                        else if(c.role__c ==  'Partner Services')
                        {
                            Task t2 = new task();
                            t2.OwnerId = c.User__c;
                            t2.Subject = 'Credit/Fraud Check';
                            t2.ActivityDate = system.today();
                          //  t2.whoid = c.id;
                            t2.WhatId = acc.id;
                            t2.Status = 'Not Started';
                            t2.priority = 'Normal';
                            t2.Description = 'Credit/Fraud Check';
                            lTask.add(t2);
                            
                            Task t21 = new task();
                            t21.OwnerId = c.User__c;
                            t21.Subject = 'Request Logo creation in Basecamp';
                            t21.ActivityDate = system.today();
                          //  t21.whoid = c.id;
                            t21.WhatId = acc.id;
                            t21.Status = 'Not Started';
                            t21.priority = 'Normal';
                            t21.Description = 'Request Logo creation in Basecamp, 3. Validate MID with Discover, 4. Merchant Set up in Admin Portal';
                            lTask.add(t21);
                            
                            Task t22 = new task();
                            t22.OwnerId = c.User__c;
                            t22.Subject = 'Validate MID with Discover';
                            t22.ActivityDate = system.today();
                          //  t22.whoid = c.id;
                            t22.WhatId = acc.id;
                            t22.Status = 'Not Started';
                            t22.priority = 'Normal';
                            t22.Description = 'Validate MID with Discover';
                            lTask.add(t22);
                            
                            
                            Task t23 = new task();
                            t23.OwnerId = c.User__c;
                            t23.Subject = 'Merchant Set up in Admin Portal';
                            t23.ActivityDate = system.today();
                          //  t23.whoid = c.id;
                            t23.WhatId = acc.id;
                            t23.Status = 'Not Started';
                            t23.priority = 'Normal';
                            t23.Description = 'Merchant Set up in Admin Portal';
                            lTask.add(t23);
                        }
                       }  
                    }
                }  
                else
                {
                        opp.addError('Please assign User to Account');
                }
                
            }  // Account loop ends
               
        }
    }
    
    if(lAcc != null)
    {
        update lAcc;
    }
    if(lTask != null)
    {
        insert lTask ;
    }
    
    
    
    
      
}