class AddColumnToTweet < ActiveRecord::Migration[5.2]
  def change
    add_column :tweets, :retweet_id, :bigint
    add_foreign_key :tweets, :tweets, column: :retweet_id
  end
end
