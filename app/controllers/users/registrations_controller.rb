class Users::RegistrationsController < Devise::RegistrationsController
  # before_action :ensure_normal_user, only: :destroy
  before_action :ensure_normal_user, only: %i[update destroy]
  def ensure_normal_user
    if resource.email == 'guest@example.com'
      redirect_to root_path, alert: 'ゲストユーザーの更新・削除はできません。'
      # redirect_to root_path, alert: 'ゲストユーザーは削除できません。'
    end
  end

end