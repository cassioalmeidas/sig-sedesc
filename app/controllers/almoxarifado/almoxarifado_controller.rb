class Almoxarifado::AlmoxarifadoController < ApplicationController
  def pundit_user
    current_usuario
  end
end