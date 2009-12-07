ActionController::Routing::Routes.draw do |map|
  map.namespace(:admin) do |admin|
     admin.resources :posts
  end

  map.namespace(:admin) do |admin|
    admin.resource :users
    admin.resources :supporters
    map.resources :admin
  end

  map.resource :public, :controller => "public"
  map.resource :user_session

  map.connect 'sandbox/:action', :controller => "sandbox"
  map.connect 'flash', :controller => 'application', :action => 'load_flash'

  map.resource :supporters
  map.root :controller => "supporters"
end
