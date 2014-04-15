class CreateMissions < ActiveRecord::Migration
  def change
    create_table :missions do |c|
      c.integer   :user_id
      c.string    :target
      c.string    :location
      c.string    :mo
      c.boolean   :completed

      c.timestamps
    end
  end
end
