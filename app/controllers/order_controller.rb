class OrderController < ApplicationController
  # Displays order page with restaurants/items to choose from
  def order_creation
    
  end
  
  # Fetches details on restaurants and items to populate the order form
  def get_details
    render json: {
      restaurants:	Restaurant.all,
      items:		Item.all
    }
  end
  
  # Creates an order from given chosen items
  def new_order
  
  end
end
