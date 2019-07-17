public with sharing class LightningProductHandler {
	
	public LightningProductHandler() {
		
	}

  @AuraEnabled
  public static List<PricebookEntry> getProductForPriceBook() {
    return [ Select PriceBook2.Name, Product2.Id, Product2.Name, UnitPrice, Name 
    				From PricebookEntry 
    					WHERE  PriceBook2.Id = '01s90000001HR0QAAW'];
  }
}

