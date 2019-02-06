class Almoxarifado::RelatorioPolicy < Struct.new(:user, :relatorio)
  def index?
    user.has_any_role? :sysadmin, :admin, :visitante
  end

end
