require 'sidekiq/web'

Rails.application.routes.draw do
  draw :madmin
	authenticate :patron, lambda { |u| u.admin? } do
  	mount Sidekiq::Web => '/sidekiq'
	end

  devise_for :patrons, controllers: { omniauth_callbacks: "patrons/omniauth_callbacks" }
	get '/privacy', to: 'home#privacy'
	get '/terms', to: 'home#terms'
	root to: 'home#index'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
