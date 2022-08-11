Rails.application.routes.draw do
  resources :ingredients
  resources :recipes
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  post 'recipe/:id/ingredient', to: 'recipes#new_ingredient', as: 'new_recipe_ingredient'
  # Defines the root path route ("/")
  # root "articles#index"
end
