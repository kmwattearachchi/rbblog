Rails.application.routes.draw do
  post '/rate' => 'rater#create', :as => 'rate'
  root :to => 'page#home'

  #devise_for :users
  devise_for :users, :controllers => { :registrations => "registrations" }
  namespace :admin do
    resources :blog_articles do
      resources :comments
    end
    resources :categories
  end
  namespace :admin do
    get 'post/index'
  end

  get :autocomplete,  controller: :page
  get :search,  controller: :page

  get 'article/view/:id', to: 'article#view', as: :article_view
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
