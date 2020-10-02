class RemoveColumnFromLike < ActiveRecord::Migration[5.2]
  def change
    remove_column :likes, :likes_number, :integer
    remove_column :likes, :retweet_number, :integer
  end
end
