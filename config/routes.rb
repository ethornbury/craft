Rails.application.routes.draw do

  devise_for :users
  root 'static_pages#home'
  resources :workphases
  resources :employees do
    collection { post :import }
  end
  resources :products do
    collection { post :import }
  end 
  resources :phases
  get 'work'      =>  'workphases#view'
  get 'about'     =>  'static_pages#about'
  get 'contact'   =>  'static_pages#contact'
  get 'manager'   =>  'static_pages#manager'

end