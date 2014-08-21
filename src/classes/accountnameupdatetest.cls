@istest(SeeAllData=true)
public class accountnameupdatetest
{
  private static TestMethod void testaccountname()
  {
  
   recordtype rt = [select id,name from recordtype where name=:'Card Holders Layouts' and Sobjecttype =:'Contact' ];
    account a = new account();
    a.Name ='Marqeta API Card Holders';
    insert a;
    
    contact c = new contact();
    c.lastname = 'test';
    c.firstname ='test new';
   // c.Accountid= a.id;
    c.RecordTypeid = rt.id;
    insert c;
    
    c.lastname = 'test2';
    c.firstname ='test new2';
   // c.Accountid= a.id;
    c.RecordTypeid = rt.id;
    update c;
  }
}