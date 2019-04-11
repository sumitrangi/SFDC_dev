public class StoreFrontController {

    List<DisplayMerchandise> products;
    List<DisplayMerchandise> shoppingCart = new List<DisplayMerchandise>();
    
    //Action method to handle purchasing process
    public PageReference addToCard() {
        for(DisplayMerchandise p : products) {
            if(0 < p.qtyToBuy) {
                shoppingCart.add(p);
            }
        }
        return null;    //stay on same page
    }
    
    public String getCartContents() {
        if(0 == shoppingCart.size()) {
            return '(empty)';
        }
        String msg = '<ul>\n';
        for(DisplayMerchandise p : shoppingCart) {
            msg += '<li>' + p.name + ' (' + p.qtyToBuy + ') ' + '</li>\n';
        }
        msg += '<ul>';
        return msg;
    }
    
    public List<DisplayMerchandise> getProducts() {
        if(products == null) {
            products = new List<DisplayMerchandise>();
            for(Merchandise__c item : [Select Id, Name, Description__c, Price__c, Quantity__c from Merchandise__c]) {
                products.add(new DisplayMerchandise(item));
            }
        }
        return products;
    }
    
    //Inner class to hold online store details for item
    public class DisplayMerchandise {
        private Merchandise__c merchandise;
        public DisplayMerchandise(Merchandise__c item) {
            this.merchandise = item;
        }
        
        //properties for use in Visualforce view
        public String name {
            get {return merchandise.Name; }
        }
        public String description {
            get {return merchandise.Description__c; }
        }
        public Decimal price {
            get {return merchandise.Price__c; }
        }
        public boolean inStock {
            get {return (0 < merchandise.Quantity__c); }
        }
        public Integer qtyToBuy { get; set;}
    }
    
    
}