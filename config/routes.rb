Rails.application.routes.draw do



  resources :friends
  devise_for :users, controllers: {
    sessions: 'users/sessions'
  }
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)

  resources :tweets do
    resources :likes
  end

  get '/api/news' => 'api#news'
  get '/api/:fecha1/:fecha2' => 'api#tweet_filter'
  post '/api', action: :create, controller: 'api'

  root "tweets#index"
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  
end
