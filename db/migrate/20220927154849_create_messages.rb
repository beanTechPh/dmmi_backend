class CreateMessages < ActiveRecord::Migration[6.0]
  def change
    create_table :messages do |t|
      t.references :inquiry, null: false, foreign_key: true
      t.references :user, polymorphic: true, null: false
      t.string :body
      t.boolean :is_read

      t.timestamps
    end
  end
end
