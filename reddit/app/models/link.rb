class Link < ActiveRecord::Base
	belongs_to :user
	has_many :comments
	acts_as_votable
	validates :url, :format => URI::regexp(%w(http https))
	validates :title , :user_id , presence: true
end
