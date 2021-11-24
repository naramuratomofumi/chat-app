class RoomsController < ApplicationController

  def index
  end

  def new
    @room = Room.new
  end

  def create #配列として受け取ったデータを含むストロングパラメーターを定義
    @room = Room.new(room_params)
    if @room.save            #保存が成功したかどうかで処理を分岐
      redirect_to root_path  #redirect_toメソッドでルートパスにリダイレクト
    else
      render :new #renderメソッドでrooms/new.html.erbのページを表示
    end
  end

  def destroy
    room = Room.find(params[:id]) #Room.find(params[:id])を使用して、削除したいチャットルームの情報を取得
    room.destroy #削除するだけなのでビューの表示は必要はない。そのため、インスタンス変数ではなく変数としてroomを定義し、destroyメソッドを使用
    redirect_to root_path
  end

  private

  def room_params #ストロングパラメーター
    params.require(:room).permit(:name, user_ids: []) #配列に対して保存を許可したい場合は、キーに対し[]を値として記述
  end
end
