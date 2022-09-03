class AddBrandAndUrlCodeToEquipments < ActiveRecord::Migration[6.0]
  def change
    add_column :equipment, :brand, :string
    add_column :equipment, :url_code, :string
  end
end
