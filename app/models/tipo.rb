class Tipo < ActiveRecord::Base
     extend FriendlyId 
  friendly_id :nome
  
  validates :nome, presence: true
end
