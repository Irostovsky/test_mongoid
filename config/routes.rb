TestMongoid::Application.routes.draw do
  get "comment/create"

  resources :articles do
    resources :comments
  end
  root :to => 'articles#index'
end
