class CreateArticulos < ActiveRecord::Migration
  def change
    create_table :articulos do |t|
      t.string :nombre
      t.text :descripcion
      t.integer :existencia
      t.float :precio_compra
      t.float :precio_venta

      t.timestamps null: false
    end
  end
end
