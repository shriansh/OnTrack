class CreateGoals < ActiveRecord::Migration
  def change
    create_table :goals do |t|
      t.string :recurringday
      t.boolean :recurring
      t.boolean :stretch
      t.string :goaloneliner
      t.boolean :complete
      t.date :duedate

      t.timestamps

    end
  end
end
