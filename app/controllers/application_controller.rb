class ApplicationController < ActionController::Base
  before_action :authenticate_user! #ログイン状態によって表示するページを切り替えるdeviseのメソッド。処理が呼ばれた段階で、ユーザーがログインしていなければ、そのユーザーをログイン画面に遷移させる
  before_action :configure_permitted_parameters, if: :devise_controller?
  
  private
  def configure_permitted_parameters                           #application_controller.rbファイルにnameカラムの保存ができる記述,上記のconfigure_permitted_parameters, if: :devise_controller?とセットで記述する
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name])
  end
end
