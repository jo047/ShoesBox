class ShoesPost < ApplicationRecord
  belongs_to :user
  attachment :shoes_image
end
