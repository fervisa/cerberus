Rails.application.routes.draw do
  root 'dashboard#index'
  mount Cerberus::Engine => "/cerberus"
end
