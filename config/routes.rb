Rails.application.routes.draw do
    get 'top/main'
    post 'top/login'
    root 'top#main'
    get 'top/logout'
    get 'top/login_form'
    resources :users
#    root 'users#index'
    get 'users/new', to: 'users#new'
    post 'users/create'
    get 'users/index', to: 'users#index'
    post 'users', to: 'users#create'
    get 'users/:uid' => 'users#destroy'
#    get 'users/:uid' => 'users#show'
    resources :tweets
#    root 'tweets#create'
#    root 'tweets#index'
    get 'tweets/new', to: 'tweets#new'
    post 'tweets/create'
    get 'tweets/index', to: 'tweets#index'
    post 'tweets', to: 'tweets#create'
    get 'tweets/:uid' => 'tweets#destroy'
    resources :likes
    post 'likes/create'
    get 'likes/:id' => 'likes#destroy'
#    root 'users#index'
#    delete 'users/:uid', to: 'users#destroy'
end
