Rails.application.routes.draw do
  # Other routes...

  devise_for :users, controllers: {
    registrations: 'users/registrations'
  }

  # Define a route for profile editing
  get '/profile/edit', to: 'profiles#edit', as: 'edit_profile'
  patch '/profile', to: 'profiles#update', as: 'update_profile'

  # Other routes...

  root to: "pages#home"
end
