class ShoesPost < ApplicationRecord
  belongs_to :user
  attachment :shoes_image
  has_many :shoes_comments, dependent: :destroy
  has_many :shoes_favorites, dependent: :destroy

  validates :shoes_image, presence: true

  def favorited_by?(user)
    shoes_favorites.where(user_id: user.id).exists?
  end
end