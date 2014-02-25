FoodExpiry::Application.routes.draw do

  get "static_pages/home"
  get "static_pages/help"
  get "static_pages/about"
  get "static_pages/contact"

  post 'foods/import_fresh_foods' => 'foods#import_fresh_foods'
  post 'foods/delete' => 'foods#delete'

  resources :foods do
    collection do
      delete 'destroy_multiple'
    end
  end
#  resources :foods
  root :to => redirect('/foods')


end
