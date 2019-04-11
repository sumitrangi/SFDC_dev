global class MyWebService {

    webService static String createMerchandise(String name, String description, Integer price, Integer quantity) {
        Merchandise__c m = new Merchandise__c( Name=name, Description__c=description, Price__c=price, Quantity__c=quantity);
        insert m;
        return m.Id;
    }
}