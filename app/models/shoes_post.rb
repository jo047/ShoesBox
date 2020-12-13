class ShoesPost < ApplicationRecord
  belongs_to :user
  attachment :shoes_image
  has_many :shoes_comments, dependent: :destroy
  has_many :shoes_favorites, dependent: :destroy

  validates :shoes_image, presence: true
  validates :shoes_introduction, length: { maximum: 150 }
  validates :shoes_name, :brand_name, length: { maximum: 100 }

  def favorited_by?(user)
    shoes_favorites.where(user_id: user.id).exists?
  end
end
