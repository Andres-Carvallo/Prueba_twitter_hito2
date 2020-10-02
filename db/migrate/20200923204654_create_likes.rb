class CreateLikes < ActiveRecord::Migration[5.2]
  def change
    create_table :likes do |t|
      t.integer :likes_number
      t.integer :retweet_number
      t.timestamps
    end
  end
end
