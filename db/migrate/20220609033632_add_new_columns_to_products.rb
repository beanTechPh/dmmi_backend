class AddNewColumnsToProducts < ActiveRecord::Migration[6.0]
  def change
    add_column :products, :raw_material, :string
    add_column :products, :coating, :string
    add_column :products, :color, :string
    add_column :products, :application, :string
    add_column :products, :usage, :string
    add_column :products, :is_top_product, :boolean, default: false
  end
end
