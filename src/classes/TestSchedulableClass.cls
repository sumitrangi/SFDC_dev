@isTest
public class TestSchedulableClass {

    public static String CRON_EXP = '0 0 0 15 3 ? 2022';
    
    static testmethod void test() {
        Test.startTest();
        
        //Schedule the test job
        String jobId = System.schedule('ScheduleApexClassTest', CRON_EXP, new MySchedulableClass());
        //Get information from CronTrigger API object
        CronTrigger ct = [Select Id, CronExpression, TimesTriggered, NextFireTime From CronTrigger Where id = :jobId];
        
        //Verify the expressions are same
        System.assertEquals(CRON_EXP, ct.CronExpression);
        //Verify job has not run
        System.assertEquals(0, ct.TimesTriggered);
        //Verify the next time the job will run
        System.assertEquals('2022-03-15 00:00:00', String.valueOf(ct.NextFireTime));
        //Verify the scheduled job has not run yet
        Merchandise__c[] m1 = [Select Id from Merchandise__c Where Name='Scheduled Job Item'];
        System.assertEquals(m1.size(), 0);
        Test.stopTest();
        
        //Scheduled job will run after Test.StopTest()
        //Verify that new Merchandise is created
        m1 = [Select Id from Merchandise__c Where Name='Scheduled Job Item'];
        System.assertEquals(m1.size(), 1);
    }

}