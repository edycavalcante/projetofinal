class Produto < ActiveRecord::Base
    extend FriendlyId 
  friendly_id :nome
  belongs_to :tipo
  
  validates:nome, presence: true
  validates :valor_venda, numericality: true
end
