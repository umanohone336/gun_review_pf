class Airgun < ApplicationRecord

  has_one_attached :image
  belongs_to :user
  # エアガンはユーザーに属する
  belongs_to :category
  # エアガンはカテゴリに属する
end
