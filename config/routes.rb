Rails.application.routes.draw do
  root to: 'inicial#index'
  devise_for :usuarios
end
