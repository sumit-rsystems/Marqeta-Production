trigger accountnameupdate on Contact (before insert, before update) 
{
      list<recordtype> rtlist = [select id,name from recordtype where name=:'Card Holders Layouts' and Sobjecttype =:'Contact' limit 1];
      list<Account> alist = [select id,name from account where name=:'Marqeta API Card Holders' limit 1];
 //system.assertEquals(1,alist.size());
 // system.assertEquals(1,rtlist.size());
  for(Contact c:Trigger.new) 
   {
    if((rtlist.size()>0 && c.RecordTypeid == rtlist[0].id)&& c.Accountid ==null)
    { 
//     list<Account> alist = [select id,id where account is=:'001i000000JmGNs' limit 1];
       if(alist.size()>0)
       c.Accountid=alist[0].id; 
    }
   }
}