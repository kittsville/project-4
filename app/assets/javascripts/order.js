function OrderPage() {
	// Fetches restaurant and item details
	$.ajax({
		type : 'POST',
		url : '/order/get_details',	
		dataType: 'json'
	}).success(function(data){
		console.log(data);
	}).fail(function(data){
		console.log('Failed to populate order form with restaurant/item details');
	});
}

// Waits until page has loaded
$( document ).ready(function() {
	orderPage = new OrderPage();
});
