class Diary < ApplicationRecord
  belongs_to :user
  belongs_to :community
  has_one_attached :image

  validates :content, presence: true
end
