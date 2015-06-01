class CreatePersonalBoards < ActiveRecord::Migration
  def change
    create_table :personal_boards do |t|
      t.string :boardmember5
      t.string :boardmember4
      t.string :boardmember3
      t.string :boardmember2
      t.string :boardmember1
      t.string :user

      t.timestamps

    end
  end
end
