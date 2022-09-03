class CreateCompanyStaffs < ActiveRecord::Migration[6.0]
  def change
    create_table :company_staffs do |t|
      t.references :company, null: false, foreign_key: true
      t.references :staff, null: false, foreign_key: true

      t.timestamps
    end
  end
end
