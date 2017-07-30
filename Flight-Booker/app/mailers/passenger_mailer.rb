class PassengerMailer < ApplicationMailer
	default from: 'topcoder52@outlook.com'
	def thank_you(passenger)
		@passenger = passenger
		mail(to: @passenger.email , subject: 'Thanks For using My Flight App :D')
	end 
end
