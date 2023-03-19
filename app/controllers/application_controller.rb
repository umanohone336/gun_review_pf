class ApplicationController < ActionController::Base

  before_action :configure_permitted_parameters, if: :devise_controller?
# devise利用の機能（ユーザ登録、ログイン認証など）が使われる前に
# configure_permitted_parametersメソッドが実行されます。

  private

  def after_sign_in_path_for(resource)
    user_path(resource)
  end

  def after_sign_out_path_for(resource)
    root_path
  end

  protected

  def configure_permitted_parameter
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name, :email])# sign_up時にユーザ名（+email）の操作を許可
  end
# configure_permitted_parametersメソッドでは、devise_parameter_sanitizer.permitメソッドを使うことで
# ユーザー登録(sign_up)の際に、ユーザー名(name)のデータ操作を許可しています
end
