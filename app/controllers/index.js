/**
 * Index Controller
 * This is the main controller run when the app is started
 */

/**
 * Constructor
 */
(function(){

	// open the main view
	$.index.open();

	// check for watch session connectivity
	if (Ti.WatchSession.isSupported) {

    	Ti.WatchSession.activateSession();

    	// add a userinfo listener to update calc from watch
		Ti.WatchSession.addEventListener('receiveuserinfo', function(e) {
		   console.log(JSON.stringify(e));
		   if(e.userInfo){
		   	$.bill.setValue(e.userInfo.bill);
		   	$.tip.setValue(e.userInfo.tip);
		   	$.split.setValue(e.userInfo.split);
		   	calculate();
		   }
		});


	}

})(); 


/**
 * Do the calulation and display the results
 */
function calculate(){

	// calc the bill 
	var bill = parseFloat($.bill.getValue());
	if(!isNaN(bill) && bill > 0){

		// work out tip
		var tip = $.tip.getValue()||0;
		var tipamount = ( bill/100) * tip;

		// work out the bill total with tip
		bill = bill + tipamount;
		$.totalbill.setText(String.format("%.2f", bill));

		// do split
		var split = $.split.getValue();
		var costeach = (split>0)?(bill/split):bill;
		$.costeach.setText(String.format("%.2f", costeach));
		
	}


}



/**
 * Close the Bill keyboard
 */
function defocusBill(){
	$.bill.blur();
}

/**
 * Close the Tip keyboard
 */
function defocusTip(){
	$.tip.blur();
}

/**
 * Close the Split keyboard
 */
function defocusSplit(){
	$.split.blur();
}

/**
 * Add a 10% tip
 */
function tip10(){
	$.tip.setValue(10);
} 

/**
 * Add a 12% tip
 */
function tip12(){
	$.tip.setValue(12);
} 

/**
 * Add a 15% tip
 */
function tip15(){
	$.tip.setValue(15);
} 