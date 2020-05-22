class Post < ApplicationRecord
  validates :title, presence: true, length: { maximum: 30 }
  validates :content, presence: true, length: { maximum: 255 }
  belongs_to :user
  mount_uploader :image, ImageUploader
end
