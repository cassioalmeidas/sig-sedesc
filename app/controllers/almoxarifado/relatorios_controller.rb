class Almoxarifado::RelatoriosController < ApplicationController
  def index
  	@entradas = Almoxarifado::Entrada.group_by_week(:created_at, format: "%d/%m/%Y").count
  	@retiradas = Almoxarifado::Retirada.group_by_week(:created_at, format: "%d/%m/%Y").count
  end
end
