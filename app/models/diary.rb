class Diary < ApplicationRecord
  belongs_to :user
  has_many :comments
  has_many_attached :images

  validates :title,:content, presence: true

  def self.search(search)
    if search != ""
      Diary.where('content LIKE(?)', "%#{search}%")
    else
      Diary.all
    end
  end
end
