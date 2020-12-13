class ShoesFavorite < ApplicationRecord
  belongs_to :user
  belongs_to :shoes_post
end
