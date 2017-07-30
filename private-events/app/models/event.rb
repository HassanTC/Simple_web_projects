class Event < ActiveRecord::Base
	 belongs_to :creator, :class_name => "User"
	 has_many :attendings, foreign_key: :attended_event_id
	has_many :attendees, through: :attendings, source: :attende
	scope :past, -> { where('event_date < ? ', Time.now) }
	scope :upcoming, -> { where('event_date > ? ', Time.now) }

end
