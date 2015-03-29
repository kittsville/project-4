function OrderPage() {
	var restaurants = [],
	items = [],
	currentRestaurantId = 0,
	restaurantSelector = $('select#restaurant'),
	startersOps = $('div#starters-wrapper');
	mainsOps = $('div#mains-wrapper');
	puddingsOps = $('div#puddings-wrapper');
	sidesOps = $('div#sides-wrapper');
	
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
						$('<p/>',{
							'class'	: 'name',
							'html'	: item.name
						}),
						$('<p/>',{
							'class'	: 'price',
							'html'	: '£' + item.price
						}),
						$('<input/>', {
							'type'	: 'checkbox'
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
