class TiposController < ApplicationController
  before_action :authenticate_usuario!
  before_action :set_tipo, only: [:show, :edit, :update, :destroy]
  

  respond_to :html

  def index
    @tipos = Tipo.all
    @tipos = Tipo.paginate(:page => params[:page], per_page: 2)
    respond_with(@tipos)
  end

  def show
    
  end

  def new
    @tipo = Tipo.new
    respond_with(@tipo)
  end

  def edit
  end

 
  
  def create
    @tipo = Tipo.new(tipo_params)

    respond_to do |format|
      if @tipo.save
        format.html { redirect_to @tipo, notice: 'Tipo criado com sucesso.' }
        format.json { render :show, status: :created, location: @tipo }
        
      else
        format.html { render :new }
        format.json { render json: @tipo.errors, status: :unprocessable_entity }
        
      end
    end
  end

  def update
    @tipo.update(tipo_params)
    respond_with(@tipo)
  end

  def destroy
    @tipo.destroy
    respond_with(@tipo)
  end

  private
    def set_tipo
      @tipo = Tipo.friendly.find(params[:id])
    end

    def tipo_params
      params.require(:tipo).permit(:nome)
    end
end
