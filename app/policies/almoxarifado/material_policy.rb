class Almoxarifado::MaterialPolicy < Almoxarifado::BasePolicy
  class Scope < Scope
    def resolve
      scope.all
    end
  end
end
