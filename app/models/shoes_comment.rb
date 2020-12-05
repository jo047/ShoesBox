class ShoesComment < ApplicationRecord
  belongs_to :user
  belongs_to :shoes_post

  validates :comment, presence: true, length: { in: 1..500 }

end
