class AddColumnsToPersonalBoard < ActiveRecord::Migration
  def change
    add_column :personal_boards, :user_id, :integer
    add_column :personal_boards, :boardmember1_id, :integer
    add_column :personal_boards, :boardmember2_id, :integer
    add_column :personal_boards, :boardmember3_id, :integer
    add_column :personal_boards, :boardmember4_id, :integer
    add_column :personal_boards, :boardmember5_id, :integer
  end
end
