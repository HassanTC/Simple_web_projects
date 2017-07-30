class EventsController < ApplicationController
	before_action :logged_in?, only: [:create, :destroy , :new]
  def index
    @events = Event.all
  end
  def new
  	@event = current_user.created_events.build
  end

  def show
  	@event = Event.find(params[:id])
  end

  def create
  	@event =current_user.created_events.build(events_params)
  	if @event.save
  	flash[:success] = "Successfully created new Event.."
  	redirect_to current_user
  	else
  		render 'events/new'
  	end
  end
  private 
  	def events_params
  		params.require(:event).permit(:start_time , :summry , :event_date , :location)
  	end
  	def logged_in?
  		if !current_user
  			flash[:danger] = "login first"
  			redirect_to login_path
  		end
  	end
end
