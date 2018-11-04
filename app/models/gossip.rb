class Gossip < ApplicationRecord
    belongs_to :users
    has_many :likes, as: :likeable
    has_many :tags
    has_many :comments, as: :commentable
end
