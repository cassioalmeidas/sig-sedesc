class Almoxarifado::RetiradaPolicy < ApplicationPolicy
	def update?
    @usuario.papel? :admin
  end

  def destroy?
    @usuario.papel? :admin
  end

  def index?
    true
  end
end
