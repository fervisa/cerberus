Rails.application.routes.draw do
  mount Cerberus::Engine => "/cerberus"
end
