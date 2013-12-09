FoodExpiry::Application.routes.draw do

  get 'foods/import_fresh_foods' => 'foods#import_fresh_foods'
  resources :foods
  root :to => redirect('/foods')


end
