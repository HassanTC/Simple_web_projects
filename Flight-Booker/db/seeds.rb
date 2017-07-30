# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)


dates = []
airports ={ "LON" => "London",
      		"LIV" => "Liverpool",
      		"GLA" => "Glasgow",
      		"MAN" => "Manchester"}
# create the aiports
airports.each do |code, airport|
  Airport.create(code: code)
end

# 10 random dates for the dates loop
5.times do 
	dates << (Faker::Date.forward(25))
end

def random_date_time(date)
	date = Faker::Time.between(date.beginning_of_day, date.end_of_day, :day)
	return date
end

airports.each_with_index do |depart_airport, depart_index| 
	depart_airport_id = depart_index + 1

	# loop over all the destination airports
	airports.each_with_index do |destination_airport, dest_index|
		dest_airport_id = dest_index + 1
		next if dest_index == depart_index
	
		# loop over all the dates
		dates.each do |date|

			# create 5 flights
			5.times do
				Flight.create(from_airport_id: depart_airport_id,
					  to_airport_id: dest_airport_id ,
					  duration: rand(1..(7.5)),
					  begin: random_date_time(date))
			end
		end
	end
end