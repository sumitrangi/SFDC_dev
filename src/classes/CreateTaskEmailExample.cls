global class CreateTaskEmailExample implements Messaging.InboundEmailHandler {

    global Messaging.InboundEmailResult handleInboundEmail(Messaging.inboundEmail email, Messaging.InboundEnvelope env){

        // Create an InboundEmailResult object for returning the result of the Apex Email Service
		Messaging.InboundEmailResult result = new Messaging.InboundEmailResult();
	    String myPlainText = email.plainTextBody;
   
		//Look up contact based on the email from address and create a Task
		try {
            Contact vCon = [SELECT Id, Name, Email FROM Contact WHERE Email = :email.fromAddress LIMIT 1];

            Task newTask = new Task(Description = myPlainText, Priority = 'Normal', Status = 'Inbound Email',
               				Subject = email.subject, IsReminderSet = true, ReminderDateTime = System.now()+1, WhoId =  vCon.Id);
	        insert newTask;    

            System.debug('New Task Object: ' + newTask );   
            System.debug('Email Object: ' + email );   
		}
        catch (QueryException e) {
            System.debug('Query Issue: ' + e);
		}
   
   		// Set the result to true. No need to send an email back to the user with an error message
   		result.success = true;

		//Send a response email
		sendEmail(email.fromAddress);

		return result;
	}
    
	public static void sendEmail(String fromEmail) {
     	// Send an email back to the from email address of who created the idea
		String[] toAddresses = new String[] {fromEmail};

		// new instance of a single email message
		Messaging.SingleEmailMessage mail = new Messaging.SingleEmailMessage();
		mail.setToAddresses(toAddresses);
		mail.setReplyTo('autoreply@sfdc.com');
       	mail.setSenderDisplayName('SFDC Reply');
   		mail.setSubject('Response to your email');
   		mail.setBccSender(false);
   		mail.setUseSignature(false);
	   	mail.setPlainTextBody('Your email is received and a task is created.');
		
        // Send the email
		Messaging.sendEmail(new Messaging.SingleEmailMessage[] { mail });
    	} 

}