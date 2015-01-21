class CreateEntradas < ActiveRecord::Migration
  def change
    create_table :entradas do |t|
      t.references :produto, index: true
      t.integer :quantidade
      t.float :valor_compra
      t.date :data_compra

      t.timestamps
    end
  end
end
