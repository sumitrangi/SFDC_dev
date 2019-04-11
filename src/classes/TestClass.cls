public class TestClass {
    public void main() {
		testCallout();
		//testSoql();
		//testSosl();
		//testDml();
		//testExceptions();
		//testBulkify();
		//testBatch();
        //MerchandiseUtility.mainProcessing();
    }
	void testCallout() {
		TestCallouts callout = New TestCallouts();
		String response = callout.invokeInventoryManagementWS();
		System.debug(response);    
    }

    void testBatch() {
        //Load data to be deleted   
        Merchandise__c[] ml = new list<Merchandise__c>();
        for(integer i=0; i<250; i++) {
            Merchandise__c m= new Merchandise__c(Name='Batch Merchandise '+i, Description__c='Test', Price__c=2, Quantity__c=100);
            ml.add(m);
            System.debug('Merchandise added: ' + i);
        }
        //insert ml;
        
        //Use batch to delete these records
        String query = 'Select Id, CreatedDate From Merchandise__c Where Name like \'Batch Merchandise%\'';
        CleanUpRecords c = new CleanUpRecords(query);
        Database.executeBatch(c);
        
    }
    
    void testBulkify() {
        //Incorrect way
        list<Merchandise__c> merList1 = [Select Id, Description__c from Merchandise__c];
        //Correct way is to use SOQL For loop
        for(list<Merchandise__c> merList : [Select Id, Description__c from Merchandise__c]) {
            System.debug('Merchandise List size: ' + merList.size());
        }
    }

    void testExceptions() {
        try {
            Merchandise__c mer1 = new Merchandise__c();
        	insert mer1;
        }
        catch(DmlException e){
            System.debug('Exception: ' + e.getMessage());
        }
    }
    
    void testDml() {
        Invoice__c inv1 = new Invoice__c();
        inv1.Description__c = 'DML Test Invoice 2';
        //insert inv1;

        Invoice__c inv2 = [Select Id, Name, Status__c from Invoice__c where Description__c = 'DML Test Invoice 2' ALL ROWS];
        inv2.Status__c = 'Negotiating';
        //update inv2;
        //delete inv2;
        //undelete inv2;

        Invoice__c inv3 = new Invoice__c(Description__c = 'Database DML Invoice 1');
        Invoice__c inv4 = new Invoice__c(Description__c = 'Database DML Invoice 2');
        //Database.SaveResult[] lsr = Database.insert(new Invoice__c[]{inv3, inv4}, false);
        //System.debug('SaveResult size: ' + lsr.size());
        //for(Database.SaveResult sr : lsr) {
        //    if(!sr.isSuccess())
        //        Database.Error err = sr.getErrors()[0];
        //}
        
        Invoice__c[] invs = [Select Id, Name, Description__c from Invoice__c where Description__c like 'Database DML%' ALL ROWS];
        System.debug('invs count : ' + invs.size());
        for(Invoice__c inv : invs) {
            System.debug('Inv Name: ' + inv.Name);
        }
        //Database.DeleteResult[] drl = Database.delete(invs, false);
        Database.UndeleteResult[] drl = Database.undelete(invs, false);
        System.debug('Result size: ' + drl.size());
        //for(Database.DeleteResult dr : drl) {
        for(Database.UndeleteResult dr : drl) {
            if(!dr.isSuccess())
                Database.Error err = dr.getErrors()[0];
        }
        
    }

    void testSoql() {
        Merchandise__c m1 = new Merchandise__c();
        m1.Name = 'Phone';
        System.debug('1 Merchandise: ' + m1.Name);
        
        Merchandise__c m2 = [Select Id, Name, Quantity__c from Merchandise__c where Name='Pencils'];
        System.debug('2 Merchandise Quantity: ' + m2.Quantity__c);
        
        Line_Item__c li1 = new Line_Item__c();
        li1 = [Select Id, Name, Unit_Price__c, Units_Sold__c, Merchandise__c, Merchandise__r.Name from Line_Item__c where Name='LI0001'];
        if(li1 != null) {
        	System.debug('Line Item Name: ' + li1.Name + ', Unit Price: ' + li1.Unit_Price__c + ', Units Sold: ' + li1.Units_Sold__c);
        } else {
            System.debug('No Line Item found');
        }

        Merchandise__c m3 = li1.Merchandise__r;
        System.debug('3 Merchandise Name: ' + m3.Name);
        System.debug('4 Merchandise Name: ' + li1.merchandise__r.Name);
        
        Invoice__c inv1 = [Select Id, Name, (Select Name, Units_sold__c from line_items__r) from Invoice__c where Name='INV-0002'];
        list<Line_Item__c> liLst = inv1.line_items__r;
        System.debug('Line Items count: ' + liLst.size());
        for(line_item__c tmp: liLst) {
            System.debug('Line Item Name: ' + tmp.Name);
        }
        
    }

    void testSosl() {
        list<list<sObject>> searchList = [FIND 'Pencils' IN ALL FIELDS RETURNING Merchandise__c(Id, Name), Invoice__c];
        
        Merchandise__c[] merList = (list<Merchandise__c>)searchList[0];
        System.debug('Merchandise Count: ' + merList.size());
        
        Invoice__c[] invList = (list<Invoice__c>)searchList[1];
        System.debug('Invoice Count: ' + invList.size());
    }

    void loadTestData() {
        Merchandise__c[] ml = new List<Merchandise__c>();
        Merchandise__c m = new Merchandise__c( Name='Pencils', Description__c='Cool pencils', Price__c=1.5, Quantity__c=1000);
		ml.add(m);
        Merchandise__c m2 = new Merchandise__c( Name='Notebooks', Description__c='Blue notebooks', Price__c=4.5, Quantity__c=2000);
        ml.add(m2);
        insert ml;
        Invoice__c inv = new Invoice__c(Description__c = 'Invoice 1');
		insert inv;
        Line_Item__c lineItem = new Line_Item__c( Name = '1', Invoice__c = inv.Id, Merchandise__c = m.Id,  Unit_Price__c = m.Price__c,  Units_Sold__c = 5);
        insert lineItem;
    }
}