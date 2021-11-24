class CreateMessages < ActiveRecord::Migration[6.0]
  def change
    create_table :messages do |t|
      t.string :content #テキストの内容
      t.references :room, null: false, foreign_key: true #メッセージの投稿をしたチャットルームのid
      t.references :user, null: false, foreign_key: true #メッセージの投稿をしたユーザーのid
      t.timestamps
    end
  end
end
