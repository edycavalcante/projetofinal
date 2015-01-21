class CreateProdutos < ActiveRecord::Migration
  def change
    create_table :produtos do |t|
      t.string :nome
      t.float :valor_venda
      t.references :tipo, index: true

      t.timestamps
    end
  end
end
