Rails.application.routes.draw do
  root to: 'inicial#index'
  devise_for :usuarios

  resources :usuarios do 
    collection do 
      get :mudar_senha
      patch :update_password
    end
  end

  namespace :almoxarifado do
    resources :materiais
    resources :entradas
    resources :retiradas do 
      member { get :comprovante }
    end
    resources :setores
    get 'relatorios', to: 'relatorios#index'
  end  
end
