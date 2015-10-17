class CreateDetails < ActiveRecord::Migration
  def change
    create_table :details do |t|
      t.references :sell, index: true, foreign_key: true
      t.references :articulo, index: true, foreign_key: true
      t.integer :catidad

      t.timestamps null: false
    end
  end
end
