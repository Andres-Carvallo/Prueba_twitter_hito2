ActiveAdmin.register User do
  # See permitted parameters documentation:
  # https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  # Uncomment all parameters which should be permitted for assignment
  #
  permit_params :email, :encrypted_password, :reset_password_token, :reset_password_sent_at, :remember_created_at, :name, :avatar_url, Tweet_count: [],
    tweet_attributes: [:id, :content, :user_id, :origin_tweet, :_destroy], Retweet_count: [], Like_count: []
  #
  # or
  #
  # permit_params do
  #   permitted = [:email, :encrypted_password, :reset_password_token, :reset_password_sent_at, :remember_created_at, :name, :avatar_url]
  #   permitted << :other if params[:action] == 'create' && current_user.admin?
  #   permitted
  # end
  index do
    selectable_column
    id_column
    column :Tweet_count do |user|
      columns user.tweets.count 
    end
    column :Retweet_count do |user|
      columns user.retweet_count
    end
    column :Like_count do |user|
      columns user.likes.count
    end
    actions
  end
  
end



