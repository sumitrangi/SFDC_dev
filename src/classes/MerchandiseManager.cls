@RestResource(urlMapping='/Merchandise/*')
global with sharing class MerchandiseManager {

    @HttpGet
    global static Merchandise__c getMerchandiseById() {
        RestRequest req = RestContext.request;
        String merchId = req.requestURI.substring(req.requestURI.lastIndexOf('/')+1);
        Merchandise__c result = [Select Name, Description__c, Price__c, Quantity__c From Merchandise__c where Id= :merchId];
        return result;
    }
    
    @HttpPost
    global static String createMerchandise(String name, String description, Decimal price, Decimal quantity) {
        Merchandise__c m = new Merchandise__c(Name=name, Description__c=description, Price__c=price, Quantity__c=quantity);
        insert m;
        return m.Id;
    }
    
}