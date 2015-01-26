class ProdutosController < ApplicationController
  before_action :authenticate_usuario!
  before_action :set_produto, only: [:show, :edit, :update, :destroy]

  respond_to :html

  def index
    @produtos = Produto.all
    @produtos = Produto.paginate(:page => params[:page], per_page: 2)
    respond_with(@produtos)
  end

  def show
   
  end

  def new
    @produto = Produto.new
    respond_with(@produto)
  end

  def edit
  end

  def create
    @produto = Produto.new(produto_params)

    respond_to do |format|
      if @produto.save
        format.html { redirect_to @produto, notice: 'Produto criado com sucesso.' }
        format.json { render :show, status: :created, location: @produto }
        
      else
        format.html { render :new }
        format.json { render json: @produto.errors, status: :unprocessable_entity }
        
      end
    end
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
       @produto = Produto.friendly.find(params[:id])
    end

    def produto_params
      params.require(:produto).permit(:nome, :valor_venda, :tipo_id)
    end
end
