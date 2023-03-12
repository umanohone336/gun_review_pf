# frozen_string_literal: true

class DeviseCreateUsers < ActiveRecord::Migration[6.1]
  def change
    create_table :users do |t|
      ## Database authenticatable
      t.string :email,              null: false, default: ""
      t.string :encrypted_password, null: false, default: ""
       ## 名前を保存するカラム
      t.string :name, null: false, default: ""
      t.boolean :is_deleted,        null: false, default: "false"
      ## Recoverable
      t.string   :reset_password_token
      t.datetime :reset_password_sent_at

      ## Rememberable
      t.datetime :remember_created_at

      ## Trackable
      # t.integer  :sign_in_count, default: 0, null: false
      # t.datetime :current_sign_in_at
      # t.datetime :last_sign_in_at
      # t.string   :current_sign_in_ip
      # t.string   :last_sign_in_ip

      ## Confirmable
      # t.string   :confirmation_token
      # t.datetime :confirmed_at
      # t.datetime :confirmation_sent_at
      # t.string   :unconfirmed_email # Only if using reconfirmable

      ## Lockable
      # t.integer  :failed_attempts, default: 0, null: false # Only if lock strategy is :failed_attempts
      # t.string   :unlock_token # Only if unlock strategy is :email or :both
      # t.datetime :locked_at


      t.timestamps null: false
    end

    add_index :users, :email,                unique: true
    add_index :users, :reset_password_token, unique: true
    # add_index :users, :confirmation_token,   unique: true
    # add_index :users, :unlock_token,         unique: true
  end
end
# null: false, 必ず値が入力されなければならないことを意味します。
# default: ""そのカラムに何も値が入力されなかった場合に、自動的に入力されるデフォルトの値を指定するオプションです。
# この場合は、空の文字列がデフォルト値として設定されます。
# (Boolean)型　真偽値
# default: "false"は、このカラムのデフォルト値をfalseに設定することを示します。
# つまり、レコードが作成された際にis_deletedカラムに値が指定されなかった場合には、falseが自動的に設定されます。
