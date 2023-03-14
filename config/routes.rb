Rails.application.routes.draw do
  # 管理者側
  devise_for :admins, skip: [:registrations, :passwords] ,controllers: {
  sessions: "admin/sessions"
}
  # ユーザー側
  # devise_for :users を次に置き換える
  devise_for :users, controllers: {
    registrations: 'users/registrations',
    passwords: 'users/passwords'
  }
  # 以下を追加
  post '/homes/guest_sign_in', to: 'homes#guest_sign_in'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  root :to =>"homes#top"
  get "home/about"=>"homes#about"
end
# get 'url' => 'コントローラー名#アクション名'
  #1. ユーザーがRailsアプリケーションのURLにアクセスする
  #2. そのURLに対応したコントローラとアクションを呼び出す
  #3. そのアクションに対応したビューを表示する
  #  syntax error 大体endが足りない,カンマがない　全角
