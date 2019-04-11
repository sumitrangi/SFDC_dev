@isTest
public class TestCleanUpBatchClass {

    static testmethod void test() {
        //query use by the batch job
        String query = 'Select Id, CreatedDate From Merchandise__c Where Id not in (Select Merchandise__c From Line_Item__c)';
        
        //Create test merchandise items to be deleted by batch job
        Merchandise__c[] ml = new list<Merchandise__c>();
        for(integer i=0; i<10; i++) {
            Merchandise__c m= new Merchandise__c(Name='Batch Merchandise '+i, Description__c='Test', Price__c=2, Quantity__c=100);
            ml.add(m);
        }
        insert ml;
        
        Test.startTest();
        CleanUpRecords c = new CleanUpRecords(query);
        Database.executeBatch(c);
        Test.stopTest();
        
        //verify merchandise got deleted
        Integer i = [Select Count() From Merchandise__c];
        System.assertEquals(i, 0);
        
    }

}