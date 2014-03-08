FoodExpiry::Application.routes.draw do

  resources :users  
  resources :sessions, only: [:new, :create, :destroy]
  root 'static_pages#home'
  match '/signup',    to:'users#new',   via:'get'
  match '/signin',    to:'sessions#new',  via:'get'
  match '/signout',   to:'sessions#destroy', via: 'delete'
  match '/help',    to:'static_pages#help',   via:'get'
  match '/about',    to:'static_pages#about',   via:'get'
  match '/contact',    to:'static_pages#contact',   via:'get'

  post 'foods/import_fresh_foods' => 'foods#import_fresh_foods'
  post 'foods/delete' => 'foods#delete'

  resources :foods do
    collection do
      delete 'destroy_multiple'
    end
  end
#  resources :foods
 # root :to => redirect('/foods')


end
