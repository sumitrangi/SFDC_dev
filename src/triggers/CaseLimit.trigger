trigger CaseLimit on Case (before insert) {
    Case_Settings__c settings = Case_Settings__c.getInstance('Daily Limit');
    System.debug('Settings object : ' + settings);
    Decimal dailylimit = settings.prop_value__c;
    System.debug('Daily Limit: ' + dailylimit);
    for(Case cs : Trigger.new) {
        System.debug('new case object: ' + cs);
        //System.debug('Today: ' + TODAY);
    	Integer caseCount = [SELECT count() FROM Case 
                             	WHERE CreatedById=:cs.OwnerId
                            	AND CreatedDate=TODAY];
    	list<User> u = [SELECT Name FROM User WHERE Id=:cs.OwnerId];
        String ownerName = u[0].Name;
        System.debug('case Count: ' + caseCount);
        If(caseCount >= dailylimit) {
            cs.addError('Daily case creation limit reached for user: ' + ownerName 
                        + ' (' + cs.OwnerId + '): ' + dailyLimit);
        }
    }
}