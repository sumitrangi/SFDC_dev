@isTest
public class JobApplicationTest {

    //Creates a job application
    public static testmethod void testSubmit() {
        system.debug('JobApplicationTest.testSubmit - Start');

        //Create test data
        Contact contact = New Contact();
        contact.FirstName = 'ContactFirstName';
        contact.LastName = 'ContactLastName';
        contact.Email = 'ContactEmail@Email.com';
        //Create Custom settings record for notification email
        Job_Application_Settings__c setting = new Job_Application_Settings__c();
        setting.Name = 'NotificationEmail';
        setting.Value__c = 'testemail@test.com';
        insert setting;

        Test.startTest();
        ApexPages.StandardController stdController = new ApexPages.standardController(contact);
        JobApplicationControllerExt extController = new JobApplicationControllerExt(stdController);
        // Test save/submit method
        PageReference testPageResult = extController.save();
        Test.stopTest();

        Id contactId = extController.contact.Id;
        System.assertNotEquals(null, contactId);

        system.debug('JobApplicationTest.testSubmit - End');
    }

}