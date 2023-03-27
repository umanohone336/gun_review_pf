class Public::SearchesController < ApplicationController

  before_action :authenticate_user!

  def search
    @range = params[:range]

    if @range == "User"
      @users = User.looks(params[:search], params[:word])
       render "public/searches/search"
    else
      @airguns = Airgun.looks(params[:search], params[:word])
       render "public/searches/search"
    end
  end

end
# ①下記コードにて検索フォームからの情報を受け取っています。
# 　検索モデル→params[:range]
# 　検索方法→params[:search]
# 　検索ワード→params[:word]


# ②if文を使い、検索モデルUserorAirgunで条件分岐させます。


# ③looksメソッドを使い、検索内容を取得し、変数に代入します。
# 検索方法params[:search]と、検索ワードparams[:word]を参照してデータを検索し、
# 1：インスタンス変数@usersにUserモデル内での検索結果を代入します。
# 2：インスタンス変数@airgunsにAirgunモデル内での検索結果を代入します。