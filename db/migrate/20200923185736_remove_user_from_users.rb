class RemoveUserFromUsers < ActiveRecord::Migration[5.2]
  def change
    remove_reference :users, :user, foreign_key: true
  end
end
