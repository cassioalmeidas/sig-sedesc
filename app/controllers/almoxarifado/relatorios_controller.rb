class Almoxarifado::RelatoriosController < ApplicationController
  def index
  	@entradas = Almoxarifado::Entrada.group_by_day(:created_at, format: "%d/%m/%Y").count
  	@retiradas = Almoxarifado::Retirada.group_by_day(:created_at, format: "%d/%m/%Y").count
  	@materiais = Almoxarifado::Material.group(:descricao).count
  end
end
