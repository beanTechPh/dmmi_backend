class AddIsAdminReadToMessages < ActiveRecord::Migration[6.0]
  def change
    add_column :messages, :is_admin_read, :boolean, default: false
  end
end
