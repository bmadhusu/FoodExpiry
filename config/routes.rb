FoodExpiry::Application.routes.draw do

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
