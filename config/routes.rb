Homeforgrandma::Application.routes.draw do
  devise_for :users
  scope module: 'private' do
    namespace :my do
      resource :property, only: [:edit, :update], controller: 'properties' do
        member do
          get  :step1, to: 'properties#edit'
          post :step2, to: 'properties#step2'
        end
      end
    end

    resources :properties, only: [] do
      member do
        post    :like
      end
    end
  end

  resources :properties, only: [:show] do
    resource :messages, only: [:create]
  end
  resource  :contact, controller: 'contact', only: [:show, :create]

  # Static routes
  get '/about',               to: "home#about",             as: 'about'
  get '/searches',            to: "properties#searches",    as: 'searches'
  get '/locations/detail',    to: "home#location",          as: 'location'
  get  '/local-information',  to: 'home#local_information', as: 'local_information'


  root to: 'home#show'
end
