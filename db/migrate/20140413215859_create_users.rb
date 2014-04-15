class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |c|
      c.string    :username
      c.string    :password_hash
      c.string    :password_salt

      c.timestamps
    end
  end
end
