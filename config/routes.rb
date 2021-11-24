Rails.application.routes.draw do
  devise_for :users
  get 'messages/index'
  root to: "rooms#index"
  resources :users, only: [:edit, :update] #ユーザー編集画面が表示されるルーティング
  resources :rooms, only: [:new, :create, :destroy] do  #roomsのルーティング、チャットルームの削除機能を実装するために、resources :roomsにdestroyアクションのルーティングを追記
    resources :messages, only: [:index, :create] #roomsが親で、messagesが子という親子関係(ルーティングのネスト)
  end
end
