Rails.application.routes.draw do
  # Only allows AJAX requests for a specific route
  class OnlyAjaxRequests
    def matches?(request)
      request.xhr?
    end
  end
  
  root to: 'order#order_creation'
  
  match '/submit_order' => 'order#new_order', :constraints => OnlyAjaxRequests.new, via: :post, defaults: {format: 'json'}
end
