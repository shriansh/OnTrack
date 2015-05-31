class CreateDailyNotes < ActiveRecord::Migration
  def change
    create_table :daily_notes do |t|
      t.string :note
      t.integer :user_id

      t.timestamps

    end
  end
end
