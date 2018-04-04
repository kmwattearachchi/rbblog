Rails.application.routes.draw do
  root :to => 'page#home'

  #devise_for :users
  devise_for :users, :controllers => { :registrations => "registrations" }
  namespace :admin do
    resources :blog_articles do
      resources :comments
    end
  end
  namespace :admin do
    get 'post/index'
  end

  get :autocomplete,  controller: :page
  get :search,  controller: :page

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
