class Almoxarifado::MaterialDecorator < Draper::Decorator
  include Draper::LazyHelpers
  delegate_all

  # Define presentation-specific methods here. Helpers are accessed through
  # `helpers` (aka `h`). You can override attributes, for example:
  #
  #   def created_at
  #     helpers.content_tag :span, class: 'time' do
  #       object.created_at.strftime("%a %m/%d/%y")
  #     end
  #   end

  def acoes
    links = []
    links << link_to(new_almoxarifado_entrada_path(material_id: object.id), class: 'btn btn-success btn-sm') do 
      fa_icon('arrow-circle-up', text: 'Entrada')
    end
    links << link_to(new_almoxarifado_retirada_path(material_id: object.id), class: 'btn btn-warning btn-sm') do 
      fa_icon('arrow-circle-down', text: 'Retirada')
    end
    links << link_to(edit_almoxarifado_material_path(object), class: 'btn btn-primary btn-sm') do 
      fa_icon('pencil-square-o', text: 'Editar')
    end
    links << link_to(new_almoxarifado_material_path(material_id: object.id), class: 'btn btn-light btn-sm') do 
      fa_icon('fa-bar-chart', text: 'Log de entradas/retiradas')
    end
    links << link_to(almoxarifado_material_path(object), class: 'btn btn-danger btn-sm') do 
      fa_icon('trash', text: 'Remover')
    end                
    safe_join(links, ' ')
  end

end
