global class MySchedulableClass implements Schedulable {

    global void execute(SchedulableContext ctx) {
        CronTrigger ct = [Select Id, CronExpression, TimesTriggered, NextFireTime From CronTrigger Where Id = :ctx.getTriggerId()];
        System.debug(ct.CronExpression);
        System.debug(ct.TimesTriggered);
        
        Merchandise__c m = new Merchandise__c(
        					Name='Scheduled Job Item',
            				Description__c='Created by the scheduler',
        					Price__c=10,
        					Quantity__c=500);
        insert m;
    }

}