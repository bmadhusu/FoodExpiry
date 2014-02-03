FoodExpiry::Application.routes.draw do

  post 'foods/import_fresh_foods' => 'foods#import_fresh_foods'
  resources :foods
  root :to => redirect('/foods')


end
