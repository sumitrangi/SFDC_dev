trigger ContactTrigger on Contact (after insert) {
	system.debug('ContactTrigger - start');
    
    List<Messaging.SingleEmailMessage> mails = new List<Messaging.SingleEmailMessage>();
    for(Contact c: trigger.new) {
        system.debug('ContactTrigger - sending email to: ' + c.email);

        //Retrieve recipient email id from custom settings
        Job_Application_Settings__c setting = Job_Application_Settings__c.getInstance('NotificationEmail');

        if(setting != null && setting.Value__c != null) {
            //Prepare email message
            Messaging.SingleEmailMessage mail = new Messaging.SingleEmailMessage();
            List<String> sendTo = new List<String>();
            //Set the custom settings value as To Address
            sendTo.add(setting.Value__c);
            mail.setToAddresses(sendTo);
            mail.setReplyTo('no-reply@no-reply.com');
      		mail.setSubject('New job application notification');
            String body = 'Hi,';
            body += '<br/><br/>New job application submitted. Candidate details:';
            body += '<br/>Name: ' + c.FirstName + ' ' + c.LastName;
            body += '<br/>Email: ' + c.Email;
            body += '<br/>Phone: ' + c.Phone;
            body += '<br/><br/>Thanks';
            mail.setHtmlBody(body);
            mails.add(mail);
        }
    }
    //Send Email Notifications
    Messaging.sendEmail(mails);

    system.debug('ContactTrigger - end');
}