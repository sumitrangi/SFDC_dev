@isTest
public class TestInventoryManagementWS {
    static testMethod void testInstallSerial() {
        System.debug('TestInventoryManagementWS.testInstallSerial - Start');
        Site__c site1 = New Site__c(Name__c='TestMethod Site 1');
        Site__c site2 = New Site__c(Name__c='TestMethod Site 2');
        list<Site__c> listSite = New list<Site__c>();
        listSite.add(site1);
        listSite.add(site2);
        insert listSite;
        System.debug('TestInventoryManagementWS.testInstallSerial - Site created');
        Site_Part__c sp = New Site_Part__c(Name='TST-111');
        sp.Installation_Site__c = site1.Id;
        insert sp;
        System.debug('TestInventoryManagementWS.testInstallSerial - Serial created');
        Test.startTest();
        System.debug('TestInventoryManagementWS.testInstallSerial - Inside startTest()');
        String response = '';
        response = InventoryManagementWS.installSerial(sp.Name, site2.Name__c);
        System.debug('TestInventoryManagementWS.testInstallSerial - response=' + response);
        Test.stopTest();
        System.debug('TestInventoryManagementWS.testInstallSerial - stopTest() complete');
        system.assertEquals('Success', response);
    }
}