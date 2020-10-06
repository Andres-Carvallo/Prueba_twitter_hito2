class User < ApplicationRecord
  
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :likes, dependent: :destroy
  has_many :tweets, dependent: :destroy
  has_many :friends, dependent: :destroy

  accepts_nested_attributes_for :tweets, allow_destroy: true

  def retweet_count
    acc = 0
    self.tweets.each do |tweet|
      acc += 1 if !tweet.origin_tweet.nil? 
    end
    acc
  end

 

  
end
