class FlightsController < ApplicationController
  def index
  	#define all airports
  	 @airports = Airport.all.map do  |e|  
      [e.code , e.id]
  	 end
  	 @travel_opetions = [1,2,3,4]
  	 @from_airport    = params[:from_airport_id]
  	 @to_airport      = params[:to_airport_id]
  	 @travelars       = params[:travelars]
  	 @begin           = params[:begin]
  	 @calender_all    = Flight.calender
     @flights         = Flight.search(params[:from_airport_id],
                             params[:to_airport_id],
                             params[:begin]
    	                    )
    if params[:commit] == "Search"
			if params[:from_airport_id] == params[:to_airport_id]
				flash[:danger] = "How to travel to The same place ??"	
			end
		end
  end
end
