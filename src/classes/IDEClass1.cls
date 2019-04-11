public with sharing class IDEClass1 {

	public static void countMerchandise() {
		list<Merchandise__c> mList = new list<Merchandise__c>();
		mList = [Select m.Name, m.Quantity__c, m.Price__c, 
					(Select Name, Unit_Price__c, Units_Sold__c From Line_Items__r) 
					From Merchandise__c m];
		
		System.debug('Total Merchandise: ' + mList.size());
		
		Integer i = 0;
		for(Merchandise__c m : mList) {
			if(m.Line_Items__r != null) {
				i += i;
			}
		}
		System.debug('Merchandise having Line Items: ' + mList.size());
		
	}
}