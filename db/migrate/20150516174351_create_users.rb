class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.integer :graduation_year
      t.string :school
      t.boolean :useractive
      t.string :profile_picture
      t.string :password
      t.string :email_address
      t.string :username

      t.timestamps

    end
  end
end
