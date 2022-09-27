class CreateInquiries < ActiveRecord::Migration[6.0]
  def change
    create_table :inquiries do |t|
      t.string :subject
      t.references :company, null: false, foreign_key: true

      t.timestamps
    end
  end
end
