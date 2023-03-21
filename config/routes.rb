Rails.application.routes.draw do

  # ユーザー側
  # ゲストユーザーが削除機能を使用できないようにするには，registrations.rbを編集する必要がある。
  # まずは，ルーティングを変更
  # 今回はユーザーのデバイス周りのコントローラーがpublicフォルダの中にある。
  devise_for :users, controllers: {
    registrations: 'public/registrations',
    sessions: 'public/sessions',
    passwords: 'public/passwords'
  }

# ゲストログイン機能
  devise_scope :user do
    post 'users/guest_sign_in', to: 'public/sessions#guest_sign_in'
  end
    # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  #会員側
  scope module: :public do
    root to: "homes#top"
    get "home/about"=>"homes#about"
    resources :airguns, only: [:index,:show,:edit,:create,:destroy,:update] do
    resources :comments, only: [:create, :destroy]
  end

    resources :users, only: [:index,:show,:edit,:update] do
      get '/unsubscribe' => 'users#unsubscribe'
    patch '/withdraw' => 'users#withdraw'

    get '/search', to: 'searches#search'
  end
  end
  #管理者側
  devise_for :admin, skip: [:registrations, :passwords] ,controllers: {
  sessions: "admin/sessions"
}
# namespaceでURLに/admin/が追加される。会員側と見分けをつける。
  namespace :admin do
    root to: "homes#top"
    resources :categories, only: [:index, :create, :edit, :update]
    resources :users, only: [:index,:show,:edit,:update]
  end

end
# get 'url' => 'コントローラー名#アクション名'
#1. ユーザーがRailsアプリケーションのURLにアクセスする
#2. そのURLに対応したコントローラとアクションを呼び出す
#3. そのアクションに対応したビューを表示する
#syntax error 大体endが足りない,カンマがない 全角