class Almoxarifado::SetoresController < Almoxarifado::AlmoxarifadoController
  before_action :set_almoxarifado_setor, only: [:edit, :update, :destroy]

  def index
    @almoxarifado_setores = Almoxarifado::Setor.ordenado
    authorize Almoxarifado::Setor
    respond_to do |format|
      format.html 
      format.json { render json: Almoxarifado::SetorDatatable.new(params) }
    end
  end

  def new
    @almoxarifado_setor = Almoxarifado::Setor.new
    authorize @almoxarifado_setor
    respond_to do |format|
      format.html
      format.js
    end 
  end

  def edit
    authorize @almoxarifado_setor
    respond_to do |format|
      format.html 
      format.js
    end
  end

  def create
    @almoxarifado_setor = Almoxarifado::Setor.new(almoxarifado_setor_params)
    authorize @almoxarifado_setor
    respond_to do |format|
      if @almoxarifado_setor.save
        format.html { redirect_to @almoxarifado_setor, notice: 'Setor criado com sucesso.' }
        format.json { render :show, status: :created, location: @almoxarifado_setor }
        format.js
      else
        format.html { render :new }
        format.json { render json: @almoxarifado_setor.errors, status: :unprocessable_entity }
        format.js { render :new }
      end
    end
  end

  def update
    authorize @almoxarifado_setor
    respond_to do |format|
      if @almoxarifado_setor.update(almoxarifado_setor_params)
        format.html { redirect_to almoxarifado_setores_path, notice: 'Setor atualizado com sucesso.' }
        format.json { render :show, status: :ok, location: @almoxarifado_setor }
      else
        format.html { render :edit }
        format.json { render json: @almoxarifado_setor.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    authorize @almoxarifado_setor
    @almoxarifado_setor.destroy
    respond_to do |format|
      format.html { redirect_to almoxarifado_setores_url, notice: 'Setor excluído com sucesso.' }
      format.json { head :no_content }
    end
  end

  private 

    def set_almoxarifado_setor
      @almoxarifado_setor = Almoxarifado::Setor.find(params[:id])
    end

    def almoxarifado_setor_params
      params.require(:almoxarifado_setor).permit(:descricao)
    end
end