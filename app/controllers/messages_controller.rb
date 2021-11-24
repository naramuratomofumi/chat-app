class MessagesController < ApplicationController
  def index
    @message = Message.new
    @room = Room.find(params[:room_id])
    @messages = @room.messages.includes(:user) #チャットルームに紐付いている全てのメッセージ（@room.messages）を@messagesと定義
  end

  def create #messagesコントローラーにcreateアクションを定義
    @room = Room.find(params[:room_id])
    @message = @room.messages.new(message_params) #@room.messages.newでチャットルームに紐づいたメッセージのインスタンスを生成し、message_paramsを引数にして、privateメソッドを呼び出す
    if @message.save
      redirect_to room_messages_path(@room)
    else
      @messages = @room.messages.includes(:user)
      render :index
    end
  end

  private

  def message_params #メッセージの内容contentをmessagesテーブルへ保存
    params.require(:message).permit(:content).merge(user_id: current_user.id)
  end
end

