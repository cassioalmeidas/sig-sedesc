class Almoxarifado::MateriaisController < Almoxarifado::AlmoxarifadoController
  before_action :set_almoxarifado_material, only: [:show, :edit, :update, :destroy]

  # GET /almoxarifado/materiais
  # GET /almoxarifado/materiais.json
  def index
    @almoxarifado_materiais = Almoxarifado::Material.all
    @almoxarifado_entrada = Almoxarifado::Entrada.new
    @almoxarifado_retirada = Almoxarifado::Retirada.new
    authorize Almoxarifado::Material
    respond_to do |format|
      format.html 
      format.json { render json: Almoxarifado::MaterialDatatable.new(params) }
    end
  end

  # GET /almoxarifado/materiais/1
  # GET /almoxarifado/materiais/1.json
  def show
    authorize @almoxarifado_material
  end

  # GET /almoxarifado/materiais/new
  def new
    @almoxarifado_material = Almoxarifado::Material.new
    authorize @almoxarifado_material
    respond_to do |format|
      format.html 
      format.js
    end
  end

  # GET /almoxarifado/materiais/1/edit
  def edit
    authorize @almoxarifado_material
  end

  # POST /almoxarifado/materiais
  # POST /almoxarifado/materiais.json
  def create
    @almoxarifado_material = Almoxarifado::Material.new(almoxarifado_material_params)
    authorize @almoxarifado_material
    respond_to do |format|
      if @almoxarifado_material.save
        format.html { redirect_to almoxarifado_materiais_path, notice: 'Material criado com sucesso.' }
        format.json { render :show, status: :created, location: @almoxarifado_material }
      else
        format.html { render :new }
        format.json { render json: @almoxarifado_material.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /almoxarifado/materiais/1
  # PATCH/PUT /almoxarifado/materiais/1.json
  def update
    authorize @almoxarifado_material
    respond_to do |format|
      if @almoxarifado_material.update(almoxarifado_material_params)
        format.html { redirect_to almoxarifado_materiais_path, notice: 'Material atualizado com sucesso.' }
        format.json { render :show, status: :ok, location: @almoxarifado_material }
      else
        format.html { render :edit }
        format.json { render json: @almoxarifado_material.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /almoxarifado/materiais/1
  # DELETE /almoxarifado/materiais/1.json
  def destroy
    authorize @almoxarifado_material
    respond_to do |format|
      if @almoxarifado_material.destroy
        format.html { redirect_to almoxarifado_materiais_url, notice: 'Material excluído com sucesso.' }
      else
        format.html { redirect_to almoxarifado_materiais_url, alert: 'Não foi possível apagar material, material possui entradas/retiradas' }
      end
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_almoxarifado_material
      @almoxarifado_material = Almoxarifado::Material.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def almoxarifado_material_params
      params.require(:almoxarifado_material).permit(:descricao, :material_id)
    end
end
