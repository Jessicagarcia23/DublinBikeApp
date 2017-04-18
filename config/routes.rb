Rails.application.routes.draw do
  get 'order/index'

  get 'order/show'

  get 'order/new'

  get 'order/edit'

  devise_for :customers
  resources :profiles
  resources :products
  resources :orders
  #get 'sessions/new'

  get 'customers/new'

  get 'static_pages/home'

  get 'about' => 'static_pages#about'

  get 'contact' => 'static_pages#contact_us'
  
  get 'cat' => 'products#index'
  
  get 'sign_up' => 'customers#new'

   get '/cart' => 'cart#index' 
  get '/cart/:id' => 'cart#add'
  get '/cart/clear' => 'cart#clearCart' 
  
 
  get 'orders' => 'orders#index'
    get '/order/:id' => 'order#add'


  get '/signedincustomerprofile' => 'profiles#signedincustomerprofile'
  get 'new_customer_session'=> 'devise/sessions#new'
  post 'customer_session' => 'devise/sessions#create'
  delete 'destroy_customer_session' => 'devise/sessions#destroy'
 

  resources :customers
  
  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  root 'static_pages#home'

end
