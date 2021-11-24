class Message < ApplicationRecord
  belongs_to :room
  belongs_to :user
  has_one_attached :image

  validates :content, presence: true, unless: :was_attached? #「content」カラムに、presence: trueを設けることで、空の場合はDBに保存しない

  def was_attached?
    self.image.attached?
  end
end
