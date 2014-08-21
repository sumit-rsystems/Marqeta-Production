@IsTest
public class TestclasforTriggers
{
public static testmethod void mytest()
{
  Program__c pr=new program__C(name='test pr');
  Insert Pr;
  Account acc=new Account(name='test accc');
  insert acc;
  contact con=new contact(lastname='test lastname',Accountid=acc.id,role__c =  'Marketing');
  insert con;
  contact con1=new contact(lastname='test lastname',Accountid=acc.id,role__c =  'Relationship Manager');
  insert con1;
  ProgramEnrollment__c PE=new ProgramEnrollment__c(CustomerID__c=con.id,Program__c=pr.id);
  insert PE;
  
  list<Transaction__c> trlist=new list<Transaction__c>();
  //for(integer i=0;i<1000;i++)
  //{
  Transaction__c Tr=new Transaction__c(date1__c=system.today(),amount__C=500,Program__c=pr.id,Contact__c=con.id,Transaction_Type__c='POS');
  //trlist.add(Tr);
  // }
 // insert trlist;
  insert Tr;
  
  Transaction__c Tr1=new Transaction__c(date1__c=system.today(),amount__C=700,Program__c=pr.id,Contact__c=con.id,Transaction_Type__c='POS');
  insert Tr1;
    Tr1.Transaction_Type__c='PurchaseOrder';
  update Tr1;
  Delete Tr1;
  

  
  Transaction__c Trns=new Transaction__c(date1__c=system.today(),amount__C=700,Program__c=pr.id,Contact__c=con.id,Transaction_Type__c=null);
   insert Trns;
   update Trns;
//Test cases for Gift

Gift__c gif=new Gift__c(contact__c=con.id,giftee_id__c='gt11',deal_id__c=11);
insert Gif;
update Gif;
//Test cases for PlusMScore

PlusMScore__c  pm=new PlusMScore__c (Contact__c=con.id,PLusMNumber__c=12,CardHolder__c='test');
insert pm;
update pm;

//Test case opportunity Closed-Won

Opportunity opp=new Opportunity (name='test',accountid=acc.id,closedate=system.today(),stagename='Prospecting');
insert opp;
//con.role__c =  'Relationship Manager';
//update con;

//opp.StageName = '4-Closed Won';
//update opp;

}

}