class Comment < ApplicationRecord
  belongs_to :user
  # コメントはユーザーに属する
  belongs_to :review
  # コメントはレビューに属する
end
