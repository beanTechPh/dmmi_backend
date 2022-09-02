class CreateEquipment < ActiveRecord::Migration[6.0]
  def change
    create_table :equipment do |t|
      t.string :name
      t.references :product_type, null: false, foreign_key: true
      t.string :serial_no
      t.string :origin
      t.string :description
      t.datetime :installed_date
      t.references :branch, null: false, foreign_key: true

      t.timestamps
    end
  end
end
