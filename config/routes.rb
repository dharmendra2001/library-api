Rails.application.routes.draw do
  devise_for :users,
             controllers: {
                 sessions: 'users/sessions',
                 registrations: 'users/registrations'
             }
  get '/member-data', to: 'members#show'
  resources :users
  resources  :books
  get 'issued/index', to: 'issued#index'
  put 'issued/:id', to: 'issued#issue'
  delete 'return', to: 'issued#return'
end