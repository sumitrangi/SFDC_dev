global with sharing class InventoryManagementWS {
    webservice static String installSerial(String serialNo, String siteId) {
        System.debug('InventoryManagementWS.installSerial - Start');
        System.debug('InventoryManagementWS.installSerial: SiteId: ' + siteId 
                     + ' serialNo: ' + serialNo);
        list<Site__c> listSite = [SELECT Id FROM Site__c WHERE Name__c=:siteId];
        list<Site_Part__c> listSP = [SELECT Id FROM Site_Part__c WHERE Name=:serialNo];
        System.debug('InventoryManagementWS.installSerial - SOQL complete');
        if(listSite.size()==0) {
            System.debug('InventoryManagementWS.installSerial - Site Id Invalid');
            return 'Site Id Invalid';
        }
        if(listSP.size()==0) {
            System.debug('InventoryManagementWS.installSerial - Serial Number Invalid');
            return 'Serial Number Invalid';
        }
        System.debug('InventoryManagementWS.installSerial - Site and Serial Number found');
        listSP[0].Installation_site__c = listSite[0].Id;
        listSP[0].Inventory_Loc__c = null;
        update listSP[0];
        System.debug('InventoryManagementWS.installSerial - Success');
        return 'Success';
    }
}