Rails.application.routes.draw do


  devise_for :users, controllers: {
    sessions: 'users/sessions'
  }
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)

  resources :tweets do
    resources :likes
  end

  post "/tweets/retweet" => "tweets#retweet", :as => :retweet

  root "tweets#index"
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  
end
