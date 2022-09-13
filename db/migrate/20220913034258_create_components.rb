class CreateComponents < ActiveRecord::Migration[6.0]
  def change
    create_table :components do |t|
      t.string :name
      t.string :brand
      t.integer :qty
      t.string :description

      t.timestamps
    end
  end
end
