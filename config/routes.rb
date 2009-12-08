ActionController::Routing::Routes.draw do |map|

  map.namespace(:admin) do |admin|
    admin.resource :users
    admin.resources :supporters
    admin.resources :posts
    map.resources :admin
  end
  
  map.resources :posts
  map.resource :supporters  
  map.resource :public, :controller => "public"
  map.resource :user_session

  map.connect 'sandbox/:action', :controller => "sandbox"
  map.connect 'flash', :controller => 'application', :action => 'load_flash'

  map.root :posts
end
