class Tweet < ApplicationRecord
    belongs_to :user
    has_many :likes
    has_many :retweet, :class_name => 'Tweet', :foreign_key => 'id'
    validates :content, presence: true

    scope :date_filter, -> (start, finish) { where('created_at >= ? AND created_at <=?', start, finish) } 
end
