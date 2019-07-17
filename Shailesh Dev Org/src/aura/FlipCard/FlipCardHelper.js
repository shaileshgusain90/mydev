({
	getProductForPriceBookList : function(Component) {
		var action = Component.get('c.getProductForPriceBook');

		var self = this;
		action.setCallBack (this,function(actionResult) {
			component.set('v.ProductForPriceBook',actionResult.getReturnValue());

		});
		$A.enqueueAction(action); 
	}
})