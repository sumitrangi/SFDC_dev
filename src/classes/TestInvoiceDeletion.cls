@isTest
public class TestInvoiceDeletion {

    static testmethod void TestDeleteInvoiceWithLineItem() {
        //create Invoice with line item and test delete
        Invoice__c inv = TestDataFactory.createOneInvoice(true);
        Test.startTest();
        Database.DeleteResult result = Database.delete(inv, false);
        Test.stopTest();
        
        //verify invoice didnt delete
        System.assert(!result.isSuccess());
    }
    
    static testmethod void TestDeleteInvoiceWithoutLineItem() {
        //create Invoice without line item and test delete
        Invoice__c inv = TestDataFactory.createOneInvoice(false);
        Test.startTest();
        Database.DeleteResult result = Database.delete(inv, false);
        Test.stopTest();
        
        //verify invoice deleted
        System.assert(result.isSuccess());
    }
    
    static testmethod void TestBulkDeleteInvoices() {
        List<Invoice__c> invList = new List<Invoice__c>();
        Invoice__c inv1 = TestDataFactory.createOneInvoice(true);
        Invoice__c inv2 = TestDataFactory.createOneInvoice(false);
        invList.add(inv1);
        invList.add(inv2);
        
        Test.startTest();
        Database.DeleteResult[] results = Database.delete(invList, false);
        Test.stopTest();
        
        //verify invoice deletion
        System.assert(!results[0].isSuccess());
        System.assert(results[1].isSuccess());
    }

}