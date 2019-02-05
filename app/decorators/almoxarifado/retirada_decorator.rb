class Almoxarifado::RetiradaDecorator < ApplicationDecorator
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
    links << link_to(comprovante_almoxarifado_retirada_path(object), class: 'btn btn-warning btn-sm', remote: true,  data: { toggle: "modal", target: "#modal-entrada"}) do 
      fa_icon('file', text: 'Comprovante')
    end
    links << link_to(almoxarifado_retirada_path(object), class: 'btn btn-danger btn-sm', method: :delete, data: { confirm: "Certeza?" }) do 
      fa_icon('trash', text: 'Remover')
    end if policy(object).destroy?

    safe_join(links, ' ')
  end
end
