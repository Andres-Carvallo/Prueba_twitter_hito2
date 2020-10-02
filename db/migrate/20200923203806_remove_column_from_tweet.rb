class RemoveColumnFromTweet < ActiveRecord::Migration[5.2]
  def change
    remove_column :tweets, :picture, :string
    remove_column :tweets, :retweet_number, :integer
    remove_column :tweets, :likes_number, :integer
  end
end
