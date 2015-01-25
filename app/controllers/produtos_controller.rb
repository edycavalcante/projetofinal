class ProdutosController < ApplicationController
  before_action :authenticate_usuario!
  before_action :set_produto, only: [:show, :edit, :update, :destroy]

  respond_to :html

  def index
    @produtos = Produto.all
    respond_with(@produtos)
  end

  def show
    respond_with(@produto)
  end

  def new
    @produto = Produto.new
    respond_with(@produto)
  end

  def edit
  end

  def create
    @produto = Produto.new(produto_params)
    @produto.save
    respond_with(@produto)
  end

  def update
    @produto.update(produto_params)
    respond_with(@produto)
  end

  def destroy
    @produto.destroy
    respond_with(@produto)
  end

  private
    def set_produto
      @produto = Produto.find(params[:id])
    end

    def produto_params
      params.require(:produto).permit(:nome, :valor_venda, :tipo_id)
    end
end
