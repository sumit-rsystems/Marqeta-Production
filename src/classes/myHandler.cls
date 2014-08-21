global class myHandler implements Messaging.InboundEmailHandler 
{
      global Messaging.InboundEmailResult handleInboundEmail(Messaging.InboundEmail email, Messaging.InboundEnvelope envelope) 
      {
          Messaging.InboundEmailResult result = new Messaging.InboundEmailresult();
          
            // Captures the sender's email address  
            String emailAddress = envelope.fromAddress;
            Boolean emailAddrsplit = emailAddress.contains('mlopez');
            Boolean emailAddrsplit1 = emailAddress.contains('support');
            Boolean emailAddrsplit2 = emailAddress.contains('jambajuice');
            Boolean emailAddrsplit3 = emailAddress.contains('marketing');
            Boolean emailAddrsplit4 = emailAddress.contains('offers');
            Boolean emailAddrsplit5 = emailAddress.contains('merchants');
            Boolean emailAddrsplit6 = emailAddress.contains('operations');
            Boolean emailAddrsplit7 = emailAddress.contains('compliance');
            Boolean emailAddrsplit8 = emailAddress.contains('sumit');
             Boolean emailAddrsplit9 = emailAddress.contains('supporttesting');
            Boolean emailAddrsplit10 = emailAddress.contains('helpdesk');
            
            
            System.debug('>>>>>>>>>>>>>>>>>>>'+ emailAddress  );
            System.debug('>>>>>>>>>>>>>>emailAddrsplit >>>>>'+ emailAddrsplit);
            
            // Retrieves the sender's first and last names  
    
          //  String fName = email.fromname.substring(0,email.fromname.indexOf(' '));
          //  String lName = email.fromname.substring(email.fromname.indexOf(' '));
                 
             Case c = new Case();
             c.Origin = 'Email';     
              if(emailAddrsplit == true)
                c.Department__c ='Customer Support';
             else if (emailAddrsplit1 == true)
                 c.Department__c ='Customer Support';
             else if(emailAddrsplit2 == true)
                 c.Department__c ='Jamba Juice STS Program';
             else if(emailAddrsplit3 == true)
                 c.Department__c ='Marketing';
             else if(emailAddrsplit4 == true)
                 c.Department__c ='Marketing';
             else if(emailAddrsplit5 == true)
                 c.Department__c ='Merchant';
             else if(emailAddrsplit6 == true)
                 c.Department__c ='Operations/Careers';
             else if(emailAddrsplit7 == true)
                 c.Department__c ='Compliance';
             else if(emailAddrsplit8 == true)
                 c.Department__c ='Facebook';  
             else if(emailAddrsplit9 == true)
                 c.Department__c ='Customer Support';
             else if(emailAddrsplit10 == true)
                 c.Department__c = 'Customer Support';          
                 
             c.Description = Email.plainTextBody;    
             c.Subject = Email.Subject + ' From Email:' + envelope.fromAddress;
           
             insert c;
             
             // Save attachments, if any
             List<Attachment> lAttachment = new List<Attachment>();
             if(email.textAttachments != null)
             {
                  for (Messaging.Inboundemail.TextAttachment tAttachment : email.textAttachments) 
                  {
                      Attachment attachment = new Attachment();
                      attachment.Name = tAttachment.fileName;
                      attachment.Body = Blob.valueOf(tAttachment.body);
                      attachment.ParentId = c.Id;
                      lAttachment.add(attachment);
                  }
              }
              //Save any Binary Attachment
              if(email.binaryAttachments != null)
              {
                  for (Messaging.Inboundemail.BinaryAttachment bAttachment : email.binaryAttachments) 
                  {
                      Attachment attachment = new Attachment();
                      attachment.Name = bAttachment.fileName;
                      attachment.Body = bAttachment.body;
                      attachment.ParentId = c.Id;
                      insert attachment;
                  }
              }
              if(lAttachment != null)
                  insert lAttachment ;
             
          return result;
      }
      
      
      
      
}