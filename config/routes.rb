Rails.application.routes.draw do
  root 'users#index'

  namespace :api do
    namespace :v1 do
      get 'users/index'
      post 'users/create'
      delete 'users/:id', to: 'users#destroy'

      get 'combats/index'
      post 'combats/create'
      delete 'combats/:id', to: 'combats#destroy'

      post 'sessions/create'
    end
  end
end
