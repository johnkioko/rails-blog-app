Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
   root "users#index"
  # Defines the root path route ("/")
  # root "articles#index"
  get 'users/:id' => 'users#show', as: :user_id
  get 'users/:user_id/posts' => 'posts#index'
  get 'users/:user_id/posts/:id' => 'posts#show', as: :post_id
end
