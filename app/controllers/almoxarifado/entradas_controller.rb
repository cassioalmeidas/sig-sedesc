class Almoxarifado::EntradasController < Almoxarifado::AlmoxarifadoController
  before_action :set_almoxarifado_entrada, only: [:show, :edit, :update, :destroy]

  # GET /almoxarifado/entradas
  # GET /almoxarifado/entradas.json
  def index
    @almoxarifado_entradas = Almoxarifado::Entrada.all
    respond_to do |format|
      format.html
      format.json { render json: Almoxarifado::EntradaDatatable.new(params) }
    end
  end

  # GET /almoxarifado/entradas/1
  # GET /almoxarifado/entradas/1.json
  def show
  end

  # GET /almoxarifado/entradas/new
  def new
    @almoxarifado_entrada = Almoxarifado::Entrada.new
    @almoxarifado_material = Almoxarifado::Material.find(params[:almoxarifado_materiais_id])
  end

  # GET /almoxarifado/entradas/1/edit
  def edit
  end

  # POST /almoxarifado/entradas
  # POST /almoxarifado/entradas.json
  def create
    @almoxarifado_entrada = Almoxarifado::Entrada.new(almoxarifado_entrada_params)
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
    respond_to do |format|
      if @almoxarifado_entrada.update(almoxarifado_entrada_params)
        format.html { redirect_to @almoxarifado_entrada, notice: 'Entrada was successfully updated.' }
        format.json { render :show, status: :ok, location: @almoxarifado_entrada }
      else
        format.html { render :edit }
        format.json { render json: @almoxarifado_entrada.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /almoxarifado/entradas/1
  # DELETE /almoxarifado/entradas/1.json
  def destroy
    @almoxarifado_entrada.destroy
    respond_to do |format|
      format.html { redirect_to almoxarifado_entradas_url, notice: 'Entrada was successfully destroyed.' }
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
