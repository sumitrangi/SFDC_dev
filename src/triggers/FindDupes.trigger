trigger FindDupes on Lead (before insert, before update) {

    System.debug('FindLeadDupes: Start');
    
    for (Lead newLead : Trigger.new) {
        if(newLead.Email != null) {
            System.debug('Lead email Id: ' + newLead.Email);
            list<Contact> dupes = [Select Id from Contact where email=:newLead.Email];
            System.debug('existing Leads count: ' + dupes.size());

            if(dupes.size() > 0) {
                System.debug('Dupe found. Adding error.');
                //newLead.addError('Email Id already associated with an existing contact.');
                newLead.Dupe_Contact__c = dupes[0].Id;
            }
        }
    }
    
    System.debug('FindLeadDupes: End');
}