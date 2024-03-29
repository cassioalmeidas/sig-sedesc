class Almoxarifado::EntradasController < Almoxarifado::AlmoxarifadoController
  before_action :set_almoxarifado_entrada, only: [:show, :edit, :update, :destroy]

  # GET /almoxarifado/entradas
  # GET /almoxarifado/entradas.json
  def index
    authorize Almoxarifado::Entrada
    @almoxarifado_entradas = Almoxarifado::Entrada.all
    respond_to do |format|
      format.html
      format.json { render json: Almoxarifado::EntradaDatatable.new(params) }
    end
  end

  # GET /almoxarifado/entradas/1
  # GET /almoxarifado/entradas/1.json
  def show
    authorize @almoxarifado_entrada
  end

  # GET /almoxarifado/entradas/new
  def new
    @almoxarifado_entrada = Almoxarifado::Entrada.new
    authorize @almoxarifado_entrada
    @almoxarifado_material = Almoxarifado::Material.find(params[:almoxarifado_materiais_id])
  end

  # GET /almoxarifado/entradas/1/edit
  def edit
    authorize @almoxarifado_entrada
    @almoxarifado_material = @almoxarifado_entrada.almoxarifado_materiais
    respond_to do |format|
      format.js
    end
  end

  # POST /almoxarifado/entradas
  # POST /almoxarifado/entradas.json
  def create
    @almoxarifado_entrada = Almoxarifado::Entrada.new(almoxarifado_entrada_params)
    authorize @almoxarifado_entrada
    respond_to do |format|
      if @almoxarifado_entrada.save
        format.html { redirect_to @almoxarifado_entrada, notice: 'Entrada criada com sucesso.' }
        format.json { render :show, status: :created, location: @almoxarifado_entrada }
        format.js
      else
        @almoxarifado_material = Almoxarifado::Material.find(params["almoxarifado_entrada"]["almoxarifado_materiais_id"])
        format.js { render :new }
      end
    end
  end

  # PATCH/PUT /almoxarifado/entradas/1
  # PATCH/PUT /almoxarifado/entradas/1.json
  def update
    authorize @almoxarifado_entrada
    respond_to do |format|
      if @almoxarifado_entrada.update(almoxarifado_entrada_params)
        format.html { redirect_to @almoxarifado_entrada, notice: 'Entrada atualizada com sucesso' }
        format.json { render :show, status: :ok, location: @almoxarifado_entrada }
        format.js
      else
        format.html { render :edit }
        format.json { render json: @almoxarifado_entrada.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /almoxarifado/entradas/1
  # DELETE /almoxarifado/entradas/1.json
  def destroy
    authorize @almoxarifado_entrada
    @almoxarifado_entrada.destroy
    respond_to do |format|
      format.html { redirect_to almoxarifado_entradas_url, notice: 'Entrada removida com sucesso.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_almoxarifado_entrada
      @almoxarifado_entrada = Almoxarifado::Entrada.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def almoxarifado_entrada_params
      params.require(:almoxarifado_entrada).permit(:almoxarifado_materiais_id, :quantidade, :numero_empenho)
    end
end
