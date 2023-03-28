class Comment < ApplicationRecord
  belongs_to :user
  # コメントはユーザーに属する
  belongs_to :airgun
  # コメントはレビューに属する
  validates :comment_body, presence: true
end
