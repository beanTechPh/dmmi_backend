class CreateServices < ActiveRecord::Migration[6.0]
  def change
    create_table :services do |t|
      t.string :name
      t.string :description
      t.boolean :is_top_service, default: false

      t.timestamps
    end
  end
end
