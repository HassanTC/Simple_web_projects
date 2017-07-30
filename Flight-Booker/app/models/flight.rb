class Flight < ActiveRecord::Base
	# Association Matters and definations 
	belongs_to :from_airport , class_name: "Airport"
	belongs_to :to_airport   , class_name: "Airport"
    # Set some validation to the input 
	validates :from_airport_id, presence: true
    validates :to_airport_id  , presence: true
    validates :duration       , presence: true
    validates :begin          , presence: true

    #some CallBacks Functions 
    def self.calender
         dates = Flight.all.order(begin: :asc)
         dates.map {|n| n.try(:begin).try(:strftime, '%B %e, %Y')  }.uniq
    end
    # Search Technique 
	def self.search(depart, dest, date)
		Flight.where(from_airport_id: depart, 
					 to_airport_id: dest,
					 begin: Flight.right_date(date)
					)
	end
    #is that a correct date ?? 
	def self.right_date(date)
		unless date.nil?
			date = date.to_date
			date.beginning_of_day..date.end_of_day
		end
	end
end
