class CreateContacts < ActiveRecord::Migration[6.0]
  def change
    create_table :contacts do |t|
      t.string :name
      t.string :company
      t.string :email
      t.string :mobile
      t.string :message

      t.timestamps
    end
  end
end
