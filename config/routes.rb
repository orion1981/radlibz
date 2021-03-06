Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :users, except: :destroy
  resources :madlibs, except: :destroy do
    resources :user_vocabs, only: [:new, :create, :show]
  end
  resources :words, only: [:index, :new, :create]
  resources :user_vocabs, except: [:new, :destroy]

  get '/login', to: 'sessions#new', as: 'login'
  post '/sessions', to: 'sessions#create', as: 'sessions'
  delete '/sessions', to: 'sessions#destroy', as: 'destroy_session'
  # get '/:page' => 'pages#show', page: 'about'
  get '/about', to: 'abouts#info', as:'info'
end
