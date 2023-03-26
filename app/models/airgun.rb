class Airgun < ApplicationRecord

  has_one_attached :image
  belongs_to :user
  # エアガンはユーザーに属する
  belongs_to :category
  # エアガンはカテゴリに属する
  has_many :comments
  validates :gun_name, presence: true
  validates :gun_caption, presence: true
end
