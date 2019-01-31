Rails.application.routes.draw do
  root to: 'inicial#index'
  devise_for :usuarios
  
  resources :usuarios

  namespace :almoxarifado do
    resources :materiais
    resources :entradas
    resources :retiradas
    resources :setores
  end  
end
