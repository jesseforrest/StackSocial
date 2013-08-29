StackSocial::Application.routes.draw do
  get '/auth/:provider/callback' => 'authentications#create'
  devise_for :users, :controllers => { :registrations => 'registrations' }
  resources :authentications  
  root :to => 'welcome#index'
end
