@istest
Class TestEmailhandler
{
public static testMethod void testTasks() 
      {
   
  // Create a new email and envelope object
     Messaging.InboundEmail email = new Messaging.InboundEmail();
     Messaging.InboundEnvelope env = new Messaging.InboundEnvelope();
     // Create the plainTextBody and fromAddres for the test
      email.plainTextBody = 'Here is my plainText body of the email';
      env.fromAddress ='mlopez@marqeta.com';
   
  myHandler testHandle= new myHandler();
  testHandle.handleInboundEmail(email, env);
  
  env.fromAddress ='support@marqeta.com';
  testHandle.handleInboundEmail(email, env);
 
  env.fromAddress ='marketing@marqeta.com';
  testHandle.handleInboundEmail(email, env);
 
  env.fromAddress ='jambajuice@marqeta.com';
  testHandle.handleInboundEmail(email, env);
 
  env.fromAddress ='merchants@marqeta.com';
  testHandle.handleInboundEmail(email, env);
 
  env.fromAddress ='offers@marqeta.com';
  testHandle.handleInboundEmail(email, env);
 
  env.fromAddress ='operations@marqeta.com';
  testHandle.handleInboundEmail(email, env);
 
  env.fromAddress ='compliance@marqeta.com';
  testHandle.handleInboundEmail(email, env);
  
  env.fromAddress ='sumit@matteys.com';
  testHandle.handleInboundEmail(email, env);

   env.fromAddress ='supporttesting@marqeta.com';
  testHandle.handleInboundEmail(email, env);
  
  env.fromAddress ='helpdesk@marqeta.com';
  testHandle.handleInboundEmail(email, env);
 
  } 
}