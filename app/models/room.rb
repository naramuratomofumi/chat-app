class Room < ApplicationRecord
  has_many :room_users
  has_many :users, through: :room_users #中間テーブルを経由して多対多のテーブルへアソシエーションを組むには、has_manyメソッドにthroughオプションを記述する必要がある
end
