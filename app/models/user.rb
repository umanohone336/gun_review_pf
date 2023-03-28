class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, authentication_keys: [:name]
  validates :name, presence: true
  validates :email, presence: true
  has_many :airguns, dependent: :destroy
  has_many :comments, dependent: :destroy
  #ユーザーは沢山のエアガンを持つ , dependent: :destroyでユーザー側が削除されたとき、エアガン側を全て削除する
  #ユーザーは沢山のコメントを持つ
  #ユーザーは沢山のレビューを持つ
  has_one_attached :profile_image

  def get_profile_image(width, height)
    unless profile_image.attached?
      file_path = Rails.root.join('app/assets/images/no_image.jpg')
      profile_image.attach(io: File.open(file_path), filename: 'default-image.jpg', content_type: 'image/jpeg')
    end
    profile_image.variant(resize_to_limit: [width, height]).processed
  end

  # 検索方法分岐
  def self.looks(search, word)
    if search == "perfect_match"
      @user = User.where("name LIKE?", "#{word}")
    elsif search == "forward_match"
      @user = User.where("name LIKE?","#{word}%")
    elsif search == "backward_match"
      @user = User.where("name LIKE?","%#{word}")
    elsif search == "partial_match"
      @user = User.where("name LIKE?","%#{word}%")
    else
      @user = User.all
    end
  end

 # is_deletedがfalseならtrueを返すようにしている
  def active_for_authentication?
    super && (is_deleted == false)
  end
  # ゲストログイン機能以下を追加
  def self.guest
    find_or_create_by!(email: 'guest@example.com') do |user|
      user.password = SecureRandom.urlsafe_base64
      user.name = "ゲストユーザー"
      # user.confirmed_at = Time.now  # Confirmable を使用している場合は必要
      # 例えば name を入力必須としているならば， user.name = "ゲスト" なども必要
    end
  end

  def email_required?
    false
  end

  def email_changed?
    false
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
