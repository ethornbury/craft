Rails.application.routes.draw do

  resources :products

  devise_for :users do
    post 'create_employee', on: :collection
  end
  resources :employees do
    collection { post :import }
  end
  
  root 'static_pages#home'
  
  get 'about'     =>  'static_pages#about'
  get 'contact'   =>  'static_pages#contact'
  get 'work'      =>  'static_pages#work'
  get 'manager'   =>  'static_pages#manager'

end
