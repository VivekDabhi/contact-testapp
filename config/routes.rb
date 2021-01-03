Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  ## Web routes
  resources :contacts
  root 'contacts#index'

  ## API routes
	namespace :api do
	  namespace :v1 do
	    resources :contacts
	  end
	end
end
