Rails.application.routes.draw do
  root to: 'inicial#index'
  devise_for :usuarios
  
  resources :usuarios

  namespace :almoxarifado do
    resources :materiais
    resources :entradas
    resources :retiradas do 
      member { get :comprovante }
    end
    resources :setores
  end  
end
