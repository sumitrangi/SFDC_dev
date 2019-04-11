trigger PartRequestDetailTrigger on Part_Request_Detail__c (before insert, before update) {
    System.debug('PartRequestDetailTrigger: Start');

    for (Part_Request_Detail__c newPRD : Trigger.new) {
        System.debug('PR Detail Id: ' + newPRD.Name);
        list<Part_Request_Header__c> PRHeader = 
            [Select Name from Part_Request_Header__c where Id=:newPRD.Header__c];
        Integer prCount = [Select Count() from Part_Request_Detail__c where Header__c=:newPRD.Header__c];

	    if(trigger.isInsert) {
		    System.debug('Inside isInsert');
	        if(PRHeader.size() > 0) {
	            System.debug('PR Header Id: ' + PRHeader[0].Name);
	            newPRD.Name = PRHeader[0].Name + '-' + String.valueOf(prCount+1);
	        } else {
	            System.debug('Part Request Header Not Found.');
	            newPRD.addError('Part Request Header Not Found.');
	        }
	    } else if(trigger.isUpdate) {
	  		System.debug('Inside isUpdate');
            //Verify that PR Detail Id is not changed
            if (newPRD.Name != Trigger.oldMap.get(newPRD.Id).Name) {
                System.debug('Changing PR Detail Id from: ' + newPRD.Name
                            + ' to: ' + Trigger.oldMap.get(newPRD.Id).Name);
	  			newPRD.Name = Trigger.oldMap.get(newPRD.Id).Name;
            }
        }
    }
    System.debug('PartRequestDetailTrigger: End');
}