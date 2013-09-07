StackSocial::Application.routes.draw do
  match '/overview' => 'overview#index', :via => [:get, :post]
  get '/auth/:provider/callback' => 'authentications#create'
  get '/twitter/user/:handle' => 'overview#user'
  devise_for :users, :controllers => { :registrations => 'registrations' }
  resources :authentications  
  root :to => 'welcome#index'
end
