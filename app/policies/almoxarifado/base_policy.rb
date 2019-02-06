class Almoxarifado::BasePolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.all
    end
  end

  def index?
  	@usuario.has_any_role? :sysadmin, :admin, :visitante
  end
  
  def destroy?
  	@usuario.has_any_role? :sysadmin, :admin
  end

  def update?
    @usuario.has_any_role? :sysadmin, :admin
  end
end
