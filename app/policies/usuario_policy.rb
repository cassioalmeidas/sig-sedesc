class UsuarioPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.all
    end
  end

  def comum
  	@usuario.has_any_role? :sysadmin
  end

  def index?
  	comum
  end

  def create?
  	comum
  end

  def update?
  	comum
  end

  def destroy?
    comum
  end

  def mudar_senha?  
    true
  end
end
