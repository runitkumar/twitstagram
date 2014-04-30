class CreatePeople < ActiveRecord::Migration
  def change
    create_table :people do |t|
      t.string :name
      t.string :twitter_handle
      t.string :instagram_name
      t.integer :twitter_id
      t.integer :instagram_id

      t.timestamps
    end
  end
end
