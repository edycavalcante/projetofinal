class EntradasController < ApplicationController
  before_action :authenticate_usuario!
  
  before_action :set_entrada, only: [:show, :edit, :update, :destroy]

  respond_to :html

  def index
    @entradas = Entrada.all
    @entradas = Entrada.paginate(:page => params[:page], per_page: 2)
    respond_with(@entradas)
  end

  def show
   
  end

  def new
    @entrada = Entrada.new
    respond_with(@entrada)
  end

  def edit
  end

 def create
    @entrada = Entrada.new(entrada_params)

    respond_to do |format|
      if @entrada.save
        format.html { redirect_to @entrada, notice: 'Entrada criado com sucesso.' }
        format.json { render :show, status: :created, location: @entrada }
        
      else
        format.html { render :new }
        format.json { render json: @entrada.errors, status: :unprocessable_entity }
        
      end
    end
  end

  def update
    @entrada.update(entrada_params)
    respond_with(@entrada)
  end

  def destroy
    @entrada.destroy
    respond_with(@entrada)
  end

  private
    def set_entrada
      @entrada = Entrada.find(params[:id])
    
    end

    def entrada_params
      params.require(:entrada).permit(:produto_id, :quantidade, :valor_compra, :data_compra)
    end
end
