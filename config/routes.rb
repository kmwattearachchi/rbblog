Rails.application.routes.draw do
  root :to => 'page#home'

  devise_for :users
  namespace :admin do
    resources :blog_articles do
      resources :comments
    end
  end
  namespace :admin do
    get 'post/index'
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
