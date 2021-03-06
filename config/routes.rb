Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  # controllername#view
  root 'pages#home'
  get 'about', to: 'pages#about'

  resources :articles
  # keyword 'resources' provides the following routes automatically:
  #     articles GET    /articles(.:format)          articles#index
  #              POST   /articles(.:format)          articles#create
  #  new_article GET    /articles/new(.:format)      articles#new
  # edit_article GET    /articles/:id/edit(.:format) articles#edit
  #      article GET    /articles/:id(.:format)      articles#show
  #              PATCH  /articles/:id(.:format)      articles#update
  #              PUT    /articles/:id(.:format)      articles#update
  #              DELETE /articles/:id(.:format)      articles#destroy
  get 'signup', to: 'users#new'
  resources :users, except: [:new]

  get 'login', to: 'sessions#new'
  post 'login', to: 'sessions#create'
  delete 'logout', to: 'sessions#destroy'

  resources :categories, except: [:destroy]
end
