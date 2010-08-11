ActionController::Routing::Routes.draw do |map|
  map.timetable ":year/:locale/timetable",
    :controller => 'events', :action => 'timetable',
    :requirements => {:year => /2\d{3}/, :locale => /en|ja/}

  map.resources :events, :path_prefix => ":year/:locale", :requirements => {:year => /2\d{3}/, :locale => /en|ja/}, :only => %w(index show)

  map.signin "/signin", :controller => 'sessions', :action => 'new'
  map.my_tickets "my_tickets", :controller => 'tickets', :action => 'index'

  map.resource :sessions, :collection => {:unauthenticated => :get}
  map.resource :account
  map.resources :rubyists

  map.resources :carts, :collection => {
    :add_item => :post, :remove_item => :delete
  }
  map.resources :orders, :collection => {
    :confirm => :get, :thanks => :get, :individual_sponsor_option => :get
  }

  map.resources :tickets, :member => {
    :regenerate_permalink => :put
  }

  map.paypal_ipn "/paypal/instant_payment_notification",
    :controller => 'paypal', :action => 'instant_payment_notification'
  map.dashboard("/dashboard",
    :controller => 'dashboard', :action => 'index')

   map.registrations(":year/:locale/Registration",
     :controller => 'registrations', :action => 'index',
     :requirements => {:year => /2\d{3}/, :locale => /en|ja/})

  map.with_options( :controller => "pages", :action => "show",
                    :defaults => {:page_name => "index"} ) do |pr|
    pr.page ":year/:locale/:page_name", :requirements => {:year => /2\d{3}/, :locale => /en|ja/ }
    pr.page ":year/:locale/:page_name.:format", :requirements => {:year => /2\d{3}/, :locale => /en|ja/ }
    pr.connect     ":year/:page_name", :requirements => {:year => /2\d{3}/}
  end

  map.root :controller => 'welcome'
  map.pusher("/pusher/auth", :controller => 'pusher', :action => 'auth')
  map.connect ':controller/:action/:id'
  map.connect ':controller/:action/:id.:format'
end
