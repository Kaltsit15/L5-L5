class Tweet < ApplicationRecord
    has_many :likes
    has_many :likes_users,through: :likes,source: :user
end
