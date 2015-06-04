Rails.application.routes.draw do

  devise_for :users
  root 'static_pages#home'
  
  resources :employees do
    collection { post :import }
  end
  
  
  get 'about'     =>  'static_pages#about'
  get 'contact'   =>  'static_pages#contact'
  get 'work'      =>  'static_pages#work'
  get 'manager'   =>  'static_pages#manager'

end
