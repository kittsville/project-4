function OrderPage() {
	var restaurants = [],
	items = [],
	currentRestaurantId = 0,
	restaurantSelector = $('select#restaurant'),
	startersOps = $('div#starters-wrapper'),
	mainsOps = $('div#mains-wrapper'),
	puddingsOps = $('div#puddings-wrapper'),
	sidesOps = $('div#sides-wrapper'),
	orderTotalDisplay = $('p#order-total'),
	orderTotal = 0;
	
	// Fetches restaurant and item details
	$.ajax({
		type : 'POST',
		url : '/order/get_details',	
		dataType: 'json'
	}).success(function(data){
		restaurants = data.restaurants;
		items = data.items;
			
		restaurants.forEach(function(restaurant,i){
			restaurantSelector.append($('<option/>',{
				html	: restaurant.name,
				value	: restaurant.id
			}));
		});
	}).fail(function(data){
		console.log('Failed to populate order form with restaurant/item details');
	});
	
	restaurantSelector.change(function(){
		updateRestaurantId();
	});
	
	$('div.order-page-wrap').on('click', 'input[type="checkbox"]', function(e){
		itemID = parseInt(e.currentTarget.value);
		
		item = $.grep(items, function(item){
			return item.id === itemID;
		})[0];
		
		if ( e.currentTarget.checked ) {
			orderTotal = Math.round((orderTotal+item.price)*100)/100
		} else {
			orderTotal = Math.round((orderTotal-item.price)*100)/100
		}
		
		orderTotalDisplay.html('£'+orderTotal);
	});
	
	function updateRestaurantId(){
		id = parseInt(restaurantSelector.val());
		
		if ( id === currentRestaurantId ) {
			return;
		} else {
			currentRestaurantId = id;
		}

		if ( isNaN(currentRestaurantId) ) {
			currentRestaurantId = 0;
		}
		
		startersOps.empty();
		mainsOps.empty();
		puddingsOps.empty();
		sidesOps.empty();
		
		items.forEach(function(item,i){
			if ( item.restaurant_id === currentRestaurantId ) {
				itemElement = $('<div/>', {
					'class'	: 'item-listing',
					'html'	: [
						$('<span/>',{
							'class'	: 'name',
							'html'	: item.name
						}),
						$('<div/>',{
							'class'	: 'price-checkbox-wrap',
							'html'	: [
								$('<span/>',{
									'class'	: 'price',
								'html'	: '£' + item.price
								}),
								$('<input/>', {
									'type'	: 'checkbox',
									'value'	: item.id
								})
							]
						})
					]
				});
				
				switch ( item.cat ) {
					case 1:
						startersOps.append(itemElement).hide().fadeIn();
					break;
					
					case 2:
						mainsOps.append(itemElement).hide().fadeIn();
					break;
					
					case 3:
						puddingsOps.append(itemElement).hide().fadeIn();
					break;
					
					case 4:
						sidesOps.append(itemElement).hide().fadeIn();
					break;
				}
			}
		});
	}
}

// Waits until page has loaded
$( document ).ready(function() {
	orderPage = new OrderPage();
});
