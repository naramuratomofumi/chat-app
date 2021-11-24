class RoomUser < ApplicationRecord
  belongs_to :room #belongs_toは、自分のテーブルが対象テーブルのレコードに所属する(対象テーブルのidカラムがある)場合に使う。
  belongs_to :user
end
