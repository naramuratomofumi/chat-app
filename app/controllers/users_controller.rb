class UsersController < ApplicationController
  def edit    #ビューファイルを表示するだけなので、アクションの定義のみになる
  end

  def update  #Userモデルの更新を行うupdateアクション
    #updateアクション内で、保存できた場合とできなかった場合で条件分岐の処理
    if current_user.update(user_params)  #ユーザー情報が格納されているcurrent_userメソッドを使用して、ログインしているユーザーの情報を更新
      redirect_to root_path  #root（チャット画面）にリダイレクト
    else
      render :edit  #失敗した場合、render :editとeditのアクションを指定しているため、editのビューが表示
    end
    end

  private

  def user_params
    params.require(:user).permit(:name, :email)
  end
end
