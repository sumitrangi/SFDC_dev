public class JobApplicationControllerExt {
    public Contact contact {get;set;}

    public JobApplicationControllerExt(ApexPages.StandardController con){
        contact = (Contact) con.getRecord();
    }

    public PageReference save(){
        system.debug('JobApplicationControllerExt.save() - start');
        insert contact;

	    //if successfully inserted new contact, then displays the thank you page.
    	//return Page.Contact_Create_Thankyou;
        return null;
    }
}