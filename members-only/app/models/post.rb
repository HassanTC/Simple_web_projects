class Post < ActiveRecord::Base
  belongs_to :user
  validates :title, presence: true, length: { maximum: 55 }
  validates :body, presence: true, length: { maximum: 255 }
end
