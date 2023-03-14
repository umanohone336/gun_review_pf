class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable, :rememberable, :validatable
         #:recoverable, :rememberable, :validatable

  has_many :airguns, dependent: :destroy
  has_many :comments, dependent: :destroy
  has_many :reviews, dependent: :destroy
  #ユーザーは沢山のエアガンを持つ , dependent: :destroyでユーザー側が削除されたとき、エアガン側を全て削除する
  #ユーザーは沢山のコメントを持つ
  #ユーザーは沢山のレビューを持つ
 
  # ゲストログイン機能以下を追加
  def self.guest
    find_or_create_by!(email: 'guest@example.com') do |user|
      user.password = SecureRandom.urlsafe_base64
      user.name = "ゲストユーザー"
      # user.confirmed_at = Time.now  # Confirmable を使用している場合は必要
      # 例えば name を入力必須としているならば， user.name = "ゲスト" なども必要
    end
  end
end

