Rails.application.routes.draw do

  devise_for :users, controllers: {registrations: 'registrations'}

  root to: "home#index"

  get 'contacts', to: 'home#contacts'
  post 'contacts', to: 'home#send_message'

  mount Judge::Engine => '/judge'

end
