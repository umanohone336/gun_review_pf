class Review < ApplicationRecord
  belongs_to :user
  # レビューはユーザーに属する
  has_many :comments
  # レビューは沢山のコメントを持つ
end
