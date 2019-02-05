class Almoxarifado::EntradaPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.all
    end
  end

  def index
  	true
  end
  
  def destroy?
  	@usuario.papel? :admin
  end

  def update?
    @usuario.papel? :admin
  end
end
