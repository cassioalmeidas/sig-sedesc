class Almoxarifado::RetiradasController < Almoxarifado::AlmoxarifadoController
  before_action :set_almoxarifado_retirada, only: [:show, :edit, :update, :destroy, :comprovante]

  # GET /almoxarifado/retiradas
  # GET /almoxarifado/retiradas.json
  def index
    authorize Almoxarifado::Entrada
    @almoxarifado_retiradas = Almoxarifado::Retirada.all
    respond_to do |format|
      format.html
      format.json { render json: Almoxarifado::RetiradaDatatable.new(params) }
    end
  end

  # GET /almoxarifado/retiradas/1
  # GET /almoxarifado/retiradas/1.json
  def show
    authorize @almoxarifado_retirada
  end

  # GET /almoxarifado/retiradas/new
  def new
    @almoxarifado_retirada = Almoxarifado::Retirada.new
    authorize @almoxarifado_retirada
    @almoxarifado_material = Almoxarifado::Material.find(params[:almoxarifado_materiais_id])
  end

  # GET /almoxarifado/retiradas/1/edit
  def edit
  end

  # POST /almoxarifado/retiradas
  # POST /almoxarifado/retiradas.json
  def create
    @almoxarifado_retirada = Almoxarifado::Retirada.new(almoxarifado_retirada_params)
    authorize @almoxarifado_retirada
    respond_to do |format|
      if @almoxarifado_retirada.save
        format.html { redirect_to @almoxarifado_retirada, notice: 'Retirada realizada com sucesso.' }
        format.json { render :show, status: :created, location: @almoxarifado_retirada }
        format.js
      else
        format.html { render :new }
        format.json { render json: @almoxarifado_retirada.errors, status: :unprocessable_entity }
        @almoxarifado_material = Almoxarifado::Material.find(params["almoxarifado_retirada"]["almoxarifado_materiais_id"])
        format.js { render :new }
      end
    end
  end

  # PATCH/PUT /almoxarifado/retiradas/1
  # PATCH/PUT /almoxarifado/retiradas/1.json
  def update
    authorize @almoxarifado_retirada
    respond_to do |format|
      if @almoxarifado_retirada.update(almoxarifado_retirada_params)
        format.html { redirect_to @almoxarifado_retirada, notice: 'Retirada atualizada com sucesso.' }
        format.json { render :show, status: :ok, location: @almoxarifado_retirada }
      else
        format.html { render :edit }
        format.json { render json: @almoxarifado_retirada.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /almoxarifado/retiradas/1
  # DELETE /almoxarifado/retiradas/1.json
  def destroy
    authorize @almoxarifado_retirada
    @almoxarifado_retirada.destroy
    respond_to do |format|
      format.html { redirect_to almoxarifado_retiradas_url, notice: 'Retirada removida com sucesso.' }
      format.json { head :no_content }
    end
  end

  def comprovante
    authorize @almoxarifado_retirada
    respond_to do |format|
      format.html
      format.js
      format.pdf do 
        render pdf: "comprovante_#{@almoxarifado_retirada.id}",
               template: 'almoxarifado/retiradas/comprovante.pdf.erb',
               layout: 'pdf.html'
      end
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_almoxarifado_retirada
      @almoxarifado_retirada = Almoxarifado::Retirada.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def almoxarifado_retirada_params
      params.require(:almoxarifado_retirada).permit(:almoxarifado_materiais_id, :quantidade, :almoxarifado_setor_id, :responsavel)
    end
end
