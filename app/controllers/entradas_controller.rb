class EntradasController < ApplicationController
  before_action :set_entrada, only: [:show, :edit, :update, :destroy]

  respond_to :html

  def index
    @entradas = Entrada.all
    respond_with(@entradas)
  end

  def show
    respond_with(@entrada)
  end

  def new
    @entrada = Entrada.new
    respond_with(@entrada)
  end

  def edit
  end

  def create
    @entrada = Entrada.new(entrada_params)
    @entrada.save
    respond_with(@entrada)
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
