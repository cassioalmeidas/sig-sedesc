class Almoxarifado::RelatoriosController < Almoxarifado::AlmoxarifadoController
  def index
    authorize([:almoxarifado, :relatorio], :index?)
  	@entradas = Almoxarifado::Entrada.group_by_week(:created_at, format: "%d/%m/%Y").count
  	@retiradas = Almoxarifado::Retirada.group_by_week(:created_at, format: "%d/%m/%Y").count
  end
end
