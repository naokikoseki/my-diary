class Diary < ApplicationRecord
  belongs_to :user
  has_many :comments
  has_many :likes, dependent: :destroy
  has_many_attached :images

  validates :title,:content, presence: true

  def self.search(search)
    if search != ""
      Diary.where('content LIKE(?)', "%#{search}%")
    else
      Diary.all
    end
  end

  def liked_by?(user)
    likes.where(user_id: user.id).exists?
  end
end
