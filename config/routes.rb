Cerberus::Engine.routes.draw do
  resources :users, except: [:destroy, :show] do
    post :authenticate, on: :collection
  end

  get 'users/login', to: 'users#login', as: 'login'
  delete 'users/logout', to: 'users#logout', as: 'logout'
end
