class Createmailers < ActiveRecord::Migration
  def change

    create_table :mailers do |t|
        t.string :smtp
        t.string :email
        t.string :username
        t.string :password
        t.boolean :auth
        t.boolean :ssl
        t.integer :port
        t.timestamps
    end

  end
end



