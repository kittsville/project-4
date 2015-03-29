Rails.application.routes.draw do
  # Only allows AJAX requests for a specific route
  class OnlyAjaxRequests
    def matches?(request)
      request.xhr?
    end
  end
  
  root to: 'order#order_creation'
  
  match '/order/submit' => 'order#new_order', :constraints => OnlyAjaxRequests.new, via: :post, defaults: {format: 'json'}
  match '/order/get_details' => 'order#get_details', :constraints => OnlyAjaxRequests.new, via: :post, defaults: {format: 'json'}
  
  get '/driver_login' => 'driver#login'
end
