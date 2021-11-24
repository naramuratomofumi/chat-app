class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :name, presence: true #「name」カラムに、presence: trueを設けることで、空の場合はDBに保存しないというバリデーションを設定

  has_many :room_users
  has_many :rooms, through: :room_users #中間テーブルを経由して多対多のテーブルへアソシエーションを組むには、has_manyメソッドにthroughオプションを記述する必要がある
end
