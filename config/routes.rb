Rails.application.routes.draw do
  root to: 'pages#home'
  devise_for :users, controllers: { registrations: 'users/registrations' }
  resources :users do   #explanation on dynamic routes documentation
    resource :profile
  end
  get 'about', to: 'pages#about'
  resources :contacts, only: :create
  
# can put [:create, :new] for multiple
# need to change applitcation layout file to have contact_us_path to work

  get 'contact-us', to: 'contacts#new', as: 'new_contact'
  
# changes "contact/new" url to "contact-us", but translates it to new_contact for _path in app layout file
# contacts#new means contacts controller, new action

end
