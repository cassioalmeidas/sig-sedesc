class UsuarioDecorator < ApplicationDecorator
  include Draper::LazyHelpers
  delegate_all

  def acoes
    links = []
    links << link_to(edit_usuario_path(object), class: 'btn btn-primary btn-sm', remote: true, data: { toggle: 'modal', target: '#modal-usuario'} ) do 
      fa_icon('pencil-square-o', text: 'Editar')
    end if policy(object).update?

    links << link_to(usuario_path(object), class: 'btn btn-danger btn-sm', method: :delete, data: { confirm: "Certeza?" }) do 
      fa_icon('trash', text: 'Remover')
    end if policy(object).destroy?

    safe_join(links, ' ')
  end
end
