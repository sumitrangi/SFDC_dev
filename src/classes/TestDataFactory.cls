@isTest
public class TestDataFactory {

    public static Invoice__c createOneInvoice(Boolean withLineItem) {
        Invoice__c inv = new Invoice__c(Description__c='Test Invoice from TestDataFactory');
        insert inv;
        
        if(withLineItem) {
            Merchandise__c mer = createMerchandise('MerchandiseTestDataFactory');
            Line_Item__c li = createLineItem(mer, inv, '1');
        }
        
        return inv;
    }
    
    private static Merchandise__c createMerchandise(String merName) {
        Merchandise__c mer1 = new Merchandise__c();
        mer1.Name = merName;
        mer1.Description__c = 'Merchandise from TestDataFactory';
        mer1.Quantity__c = 500;
        mer1.Price__c = 10;
        
        insert mer1;
        return mer1;
    }
    
    private static Line_Item__c createLineItem(Merchandise__c mer, Invoice__c inv, String liName) {
        
        Line_Item__c li1 = new Line_Item__c();
        li1.Name = liName;
        li1.Merchandise__c = mer.Id;
        li1.Invoice__c = inv.Id;
        li1.Unit_Price__c = mer.Price__c;
        li1.Units_Sold__c = 1;
        
        insert li1;
        return li1;
    }

}