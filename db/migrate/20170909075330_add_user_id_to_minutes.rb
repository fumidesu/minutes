class AddUserIdToMinutes < ActiveRecord::Migration
  def change
    add_column :minutes, :user_id, :integer
  end
end
