Rails.application.routes.draw do
  namespace :almoxarifado do
    resources :retiradas
  end
  namespace :almoxarifado do
    resources :entradas
  end
  root to: 'inicial#index'
  devise_for :usuarios
  
  resources :usuarios

  namespace :almoxarifado do
    resources :materiais
  end  
end
