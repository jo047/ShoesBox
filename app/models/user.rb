class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :shoes_posts, dependent: :destroy
  has_many :shoes_comments, dependent: :destroy
  has_many :shoes_favorites, dependent: :destroy

  attachment :profile_image

  validates :name, presence: true, length: { in: 2..20 }
  validates :email, presence: true, length: { in: 3..256 }
  validates :self_introduction, length: { maximum: 150 }

end
