class User < ActiveRecord::Base
	 before_save { self.email = email.downcase }
	validates :name , presence: true, length: {minimum: 4 , maximum: 50}
	 VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
	validates :email, presence: true, length: {minimum: 8 , maximum: 250},
					  format: {with: VALID_EMAIL_REGEX},
					  uniqueness: { case_sensitive: false }
	has_many :created_events, :foreign_key => "creator_id", :class_name => "Event"
	has_many :attendings, foreign_key: :attendee_id
	has_many :attended_events, through: :attendings, source: :attended_event
end
