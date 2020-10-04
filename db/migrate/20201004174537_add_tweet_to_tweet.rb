class AddTweetToTweet < ActiveRecord::Migration[5.2]
  def change
    add_column :tweets, :origin_tweet, :bigint
    add_foreign_key :tweets, :tweets, column: :origin_tweet
  end
end
