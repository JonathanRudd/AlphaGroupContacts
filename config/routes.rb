Rails.application.routes.draw do
  get 'language_switching/toggle_locale'
  # Other routes...

  devise_for :users, controllers: {
    registrations: 'users/registrations'
  }

  # Define a route for profile editing
  get '/profile/edit', to: 'profiles#edit', as: 'edit_profile'
  patch '/profile', to: 'profiles#update', as: 'update_profile'

  # define a route for the show action
  get '/profile/:id', to: 'profiles#show', as: 'profile'

  root to: "pages#home"

  post '/toggle_locale', to: 'language_switching#toggle_locale', as: :toggle_locale

end
