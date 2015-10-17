class CreateSells < ActiveRecord::Migration
  def change
    create_table :sells do |t|
      t.references :user, index: true, foreign_key: true
      t.references :cliente, index: true, foreign_key: true
      t.float :total

      t.timestamps null: false
    end
  end
end
