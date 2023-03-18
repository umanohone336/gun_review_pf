class Public::AirgunsController < ApplicationController
  before_action :authenticate_user!
  before_action :ensure_correct_user, only: [:edit, :update, :destroy]

  def create
    #  データを受け取り新規登録するためのインスタンス作成
    @airgun = Airgun.new(airgun_params)
    @airgun.user_id = current_user.id
    # データをデータベースに保存するためのsaveメソッド実行
    if @airgun.save
    # 画面の遷移
      redirect_to airguns_path, notice: "投稿に成功しました。"
    else
      @airguns = Airgun.all
      render 'index'
    end
  end

  def index
    @airguns = Airgun.all
    @airgun = Airgun.new
  end

  def show
    @airgun = Airgun.find(params[:id])
    @airgun_new = Airgun.new
    @comment = Comment.new
  end

  def edit
    @airgun = Airgun.find(params[:id])
  end

  def update
    @airgun = Airgun.find(params[:id])
    if @airgun.update(airgun_params)
      redirect_to airgun_path(@airgun), notice: "内容を更新しました。"
    else
      render "edit"
    end
  end

  def destroy
    @airgun = Airgun.find(params[:id])
    @airgun.destroy
    redirect_to airguns_path, notice: "削除が完了しました。"
  end

   # 投稿データのストロングパラメータ
  private

  def airgun_params
    params.require(:airgun).permit(:gun_name, :image, :caption)
  end

  def ensure_correct_user
      @airgun = Airgun.find(params[:id])
      unless @airgun.user == current_user
        redirect_to airguns_path, alert: "この操作は許可されていません"
      end
  end

end

# インスタンス変数
# 変数の名前の先頭に@マークをつける。コントローラーとViewでデータの受け渡しができる

# ローカル変数
# 変数の名前の先頭には何もつけない。 コントローラーとViewでデータの受け渡しができない

# params formから送られてくるデータはparamsの中に入っています。
# require 送られてきたデータの中からモデル名(ここでは:airgun)を指定し、データを絞り込みます。
# permit requireで絞り込んだデータの中から、保存を許可するカラムを指定します。
# private 一種の境界線で、「ここから下はこのcontrollerの中でしか呼び出せません」という意味