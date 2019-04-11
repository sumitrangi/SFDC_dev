trigger LeadTrigger on Lead (before insert) {

    /*
    Set<String> newEmailsSet = new Set<String>();
    Set<String> newPhoneNumbersSet = new Set<String>();
    for(Lead l : Trigger.new) {
        newEmailsSet.add(l.email);
        newEmailsSet.add(l.custom_email__c);
        newPhoneNumbersSet.add(l.Phone);
        newPhoneNumbersSet.add(l.Custom_Phone__c);
    }
    List<Lead> lstExistingLeads = [Select Id,Email,Custom_Email__c,Phone,Custom_Phone__c From Lead Where Email IN : newEmailsSet
                                  OR Custom_Email__c IN : newEmailsSet OR Phone IN : newPhoneNumbersSet 
                                  OR Custom_Phone__c IN : newPhoneNumbersSet AND isConverted=false];
    Map<String, Lead> existingLeadMap = new Map<String, Lead>();
    if(!lstExistingLeads.isEmpty()) {
        for(Lead existingLead : lstExistingLeads) {
            existingLeadMap.put(existingLead.Email, existingLead);
            existingLeadMap.put(existingLead.Custom_Email__c, existingLead);
            existingLeadMap.put(existingLead.Phone, existingLead);
            existingLeadMap.put(existingLead.Custom_Phone__c, existingLead);
        }
    }

    for(Lead l : Trigger.new) {
        String fullRecordURL = '';
        if(existingLeadMap.containsKey(l.Email)) {
              fullRecordURL = URL.getSalesforceBaseUrl().toExternalForm() + '/' + existingLeadMap.get(l.Email).Id;
        } else if(existingLeadMap.containsKey(l.Custom_Email__c)) {
              fullRecordURL = URL.getSalesforceBaseUrl().toExternalForm() + '/' + existingLeadMap.get(l.Custom_Email__c).Id;
        } else if(existingLeadMap.containsKey(l.Phone))  {
              fullRecordURL = URL.getSalesforceBaseUrl().toExternalForm() + '/' + existingLeadMap.get(l.Phone).Id;
        } else if(existingLeadMap.containsKey(l.Custom_Phone__c))  {
              fullRecordURL = URL.getSalesforceBaseUrl().toExternalForm() + '/' + existingLeadMap.get(l.Custom_Phone__c).Id;
        }
        
        if(fullRecordURL!='') {
            l.addError('Existing Lead Found. Id: ' + fullRecordURL);
        }
    }
*/
}