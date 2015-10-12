class CreateClientes < ActiveRecord::Migration
  def change
    create_table :clientes do |t|
      t.string :nombre
      t.string :telefono
      t.string :domicilio
      t.string :correo
      t.string :categoria

      t.timestamps null: false
    end
  end
end
