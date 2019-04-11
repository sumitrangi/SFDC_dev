// Automatically populate a lookup field to the ZipCode object
trigger SiteTrigger on Site__c (before insert, before update) {
    Map<String, Id> zipMap = new Map<String, Id>();
    list<Zip_Code__c> zipList = [Select Id, Name from Zip_Code__c];
    
    for (Zip_Code__c zip : zipList){
        zipMap.put(zip.Name, zip.Id);
    }

    for (Site__c st : Trigger.new) {
        // Find the ZipCode record based on the entered value
		//Zip_Code__c zp = [SELECT Id, Name FROM Zip_Code__c WHERE Name =:st.Zip_Value__c];
		//st.Zip_Code__c = zp.Id;
        st.Zip_Code__c = zipMap.get(st.Zip_Value__c);
    }
}