trigger RestrictInvoiceDeletion on Invoice__c (before delete) {

    System.debug('RestrictInvoiceDeletion start.');
    for(Invoice__c inv : [Select Id from Invoice__c where Id in (Select invoice__c from Line_Item__c) And Id IN :Trigger.old]) {
        System.debug('Associated Line Item found.');
        Trigger.oldMap.get(inv.Id).addError('Cannot delete Invoice with Line Items.');
    }

}