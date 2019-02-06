class UsuarioPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.all
    end
  end

  def comum
  	@usuario.has_any_role? :sysadmin, :admin
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
end
