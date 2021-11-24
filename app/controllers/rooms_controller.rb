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

  private

  def room_params #ストロングパラメーター
    params.require(:room).permit(:name, user_ids: []) #配列に対して保存を許可したい場合は、キーに対し[]を値として記述
  end
end
