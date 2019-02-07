class UsuariosController < ApplicationController
  before_action :set_usuario, only: [:destroy, :edit, :update]

  def index
    authorize Usuario
  	respond_to do |format|
      format.html
      format.json { render json: UsuarioDatatable.new(params) }
  	end
  end

  def new
    @usuario = Usuario.new
    authorize @usuario
    respond_to do |format|
      format.html
      format.js
    end 
  end

  def edit
    authorize @usuario
    respond_to do |format|
      format.js
    end
  end

  def mudar_senha
    @usuario = current_usuario
  end

  def update_password
    @usuario = current_usuario
    usuario_params.except(:username, :email, :role_ids)
    if @usuario.update_with_password(usuario_params)
      # Sign in the user by passing validation in case their password changed
      bypass_sign_in(@usuario)
      redirect_to(root_path, notice: 'Sua senha foi atualizada com sucesso.')
    else
      render :mudar_senha
    end
  end

  def create
    @usuario = Usuario.new(usuario_params)
    authorize @usuario
    respond_to do |format|
      if @usuario.save
        format.js 
      else
        format.js { render :new }
      end
    end 
  end

  def update
    authorize @usuario
    if params[:usuario][:password].blank?
      params[:usuario].delete(:password)
      params[:usuario].delete(:password_confirmation)
    end
    respond_to do |format|
      if @usuario.update(usuario_params)
        format.js
      else
        format.js { render :edit }
      end
    end 
  end

  def destroy
    authorize @usuario
    respond_to do |format|
      if @usuario.destroy
        format.html { redirect_to usuarios_url, notice: 'Usuário excluído com sucesso.' }
      else
        format.html { redirect_to usuarios_url, alert: 'Não foi possível remover o usuário' }
      end
    end
  end

  private

    def set_usuario
      @usuario = Usuario.find(params[:id])
    end

    def usuario_params
      params.require(:usuario).permit(:username, :email, :password, :current_password, :password_confirmation, role_ids: [])
    end
end
