class AddUserIdToMinutes < ActiveRecord::Migration
  def change
    add_column :minutes, :user_id, :integer
    add_column :minutes, :mail, :string
  end
end
