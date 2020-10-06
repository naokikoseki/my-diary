class Diary < ApplicationRecord
  belongs_to :user
  has_many_attached :images

  validates :title,:content, presence: true
end
