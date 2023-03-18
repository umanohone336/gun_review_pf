class Public::UsersController < ApplicationController
  before_action :authenticate_user!
  before_action :ensure_correct_user, only: [:edit, :update]

  def show
    @user = User.find(params[:id])
    @airguns = @user.books
    @airgun = Airgun.new
  end

  def index
    @users = User.all
    @airgun = Airgun.new
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    if @user.update(user_params)
      redirect_to user_path(@user), notice: "会員情報を更新しました。"
    else
      render "edit"
    end
  end

   private

  def user_params
    params.require(:user).permit(:name, :introduction, :profile_image)
  end

  def ensure_correct_user
    @user = User.find(params[:id])
    unless @user == current_user
      redirect_to user_path(current_user), alert: "この操作は許可されていません"
    end
  end

end
# unlessはifの反対で「もし〜でなければ」という意味になりますので
# unless @user == current_user
# もし@userとcurrent_user(ログインしているユーザー)が一致してなければ、という意味になります。
# 一致していなかった場合、ログインしているuserのshowページにリダイレクトする仕組みになっています。