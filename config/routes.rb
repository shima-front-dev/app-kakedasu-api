Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  namespace :api do
    namespace :v1 do
      resources :users
      # resources :users, only:[:index]
      resources :hello, only:[:index]

    end
  end
end
