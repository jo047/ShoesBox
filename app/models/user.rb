class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :shoes_posts, dependent: :destroy
  has_many :shoes_comments, dependent: :destroy
  has_many :shoes_favorites, dependent: :destroy

  attachment :profile_image

end
