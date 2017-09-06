class CreateMinutes < ActiveRecord::Migration
  def change
    create_table :minutes do |t|
      t.string :title
      t.date :date
      t.string :chairman
      t.string :department
      t.string :location
      t.text :participant
      t.text :absent
      t.text :cc
      t.text :agenda

      t.string :nummer
      t.string :subject
      t.text :action
      t.string :responsible
      t.date :duedate
      t.string :status

      t.timestamps null: false
    end
  end
end
