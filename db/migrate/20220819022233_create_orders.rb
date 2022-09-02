class CreateOrders < ActiveRecord::Migration[6.0]
  def change
    create_table :orders do |t|
      t.string :id_no
      t.datetime :date
      t.string :status
      t.string :description
      t.float :price
      t.references :company, null: false, foreign_key: true

      t.timestamps
    end
  end
end
