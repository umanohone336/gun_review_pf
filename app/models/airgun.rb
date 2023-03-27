class Airgun < ApplicationRecord

  has_one_attached :image
  belongs_to :user
  # エアガンはユーザーに属する
  belongs_to :category
  # エアガンはカテゴリに属する
  has_many :comments
  validates :gun_name, presence: true
  validates :gun_caption, presence: true

  # 検索方法分岐
  def self.looks(search, word)
    if search == "perfect_match"
      @airgun = Airgun.where("gun_name LIKE?","#{word}")
    elsif search == "forward_match"
      @airgun = Airgun.where("gun_name LIKE?","#{word}%")
    elsif search == "backward_match"
      @airgun = Airgun.where("gun_name LIKE?","%#{word}")
    elsif search == "partial_match"
      @airgun = Airgun.where("gun_name LIKE?","%#{word}%")
    else
      @airgun = Airgun.all
    end
  end


end
# 各検索方法を下記のように指定しました。
# 検索フォーム作成時に記載した内容を見返してみてください。
# ・完全一致→perfect_match
# ・前方一致→forward_match
# ・後方一致→backword_match
# ・部分一致→partial_match

# 送られてきたsearchによって条件分岐させましょう。

# そして、whereメソッドを使いデータベースから該当データを取得し、変数に代入します。

# 完全一致以外の検索方法は、
# #{word}の前後(もしくは両方に)、__%__を追記することで定義することができます。

# これにより、検索方法毎に適した検索が行われるようになりました。

