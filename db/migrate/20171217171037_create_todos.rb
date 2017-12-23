class CreateTodos < ActiveRecord::Migration
  def change
    create_table :todos do |t|
      t.date :date
      t.string :action
      t.string :responsible
      t.date :duedate
      t.string :status

      t.timestamps null: false
    end
  end
end
