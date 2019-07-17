trigger HandleProductPriceChange on Merchandise__c (after update){

//update invoice line items associated with open invoices

list<Line_Item__c> openLineItems = [Select j.unit_Price__C,j.Merchandise__r.Price__c from Line_Item__C j WHERE j.Invoice_Statement__r.Status__c = 'Negotiating'
AND j.Merchandise__r.id IN :Trigger.new
FOR UPDATE];

for (Line_Item__c li: openLineItems) {
if ( li.Merchandise__r.Price__c < li.Unit_Price__c ){
li.Unit_Price__c = li.Merchandise__r.Price__c;
}
}
update openLineItems;
                                                         

}