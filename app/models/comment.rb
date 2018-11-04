class Comment < ApplicationRecord
    has_many :likes, as: :likeable
    belongs_to :commentable, polymorphic: true
end
