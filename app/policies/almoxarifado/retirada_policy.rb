class Almoxarifado::RetiradaPolicy < Almoxarifado::BasePolicy
  class Scope < Scope
    def resolve
      scope.all
    end
  end
end
