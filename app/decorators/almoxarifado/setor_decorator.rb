class Almoxarifado::SetorDecorator < ApplicationDecorator
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
    links << link_to(edit_almoxarifado_setor_path(object), class: 'btn btn-info btn-sm', remote: true,  data: { toggle: "modal", target: "#modal-setor"}) do 
      fa_icon('pencil-square-o', text: 'Editar')
    end 
    links << link_to(almoxarifado_setor_path(object), class: 'btn btn-danger btn-sm', data: { confirm: "Você tem certeza?" }, method: :delete) do 
      fa_icon('trash', text: 'Remover')
    end
    safe_join(links, ' ')
  end  

end
