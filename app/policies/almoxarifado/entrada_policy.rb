class Almoxarifado::EntradaPolicy < Almoxarifado::BasePolicy
  class Scope < Scope
    def resolve
      scope.all
    end
  end

  def create?
  	@usuario.has_any_role? :sysadmin, :admin, :operador
  end
end
