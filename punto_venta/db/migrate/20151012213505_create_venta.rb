class CreateVenta < ActiveRecord::Migration
  def change
    create_table :venta do |t|
      t.references :user, index: true, foreign_key: true
      t.references :cliente, index: true, foreign_key: true
      t.date :fecha
      t.float :total

      t.timestamps null: false
    end
  end
end
