class Entrada < ActiveRecord::Base 
   
  belongs_to :produto
  
  validates :quantidade, numericality: { only_integer: true }
  validates :valor_compra, numericality: true
  validates :data_compra, presence:true
end
