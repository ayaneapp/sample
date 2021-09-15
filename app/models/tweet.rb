class Tweet < ApplicationRecord
    has_many :likes, dependent: :destroy
    validates :feeling, presence:true
end
