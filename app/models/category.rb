class Category < ApplicationRecord

  has_many :airguns
  # カテゴリは沢山のエアガンを持つ

end
