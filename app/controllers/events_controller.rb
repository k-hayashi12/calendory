class EventsController < ApplicationController

	def new
		@event = Event.new
	end

	def show
	end

	def create
		@event = Event.new(event_parameter)
		@event.user_id = current_user.id
		@event.save
		redirect_to user_path(@event.user_id)
	end

	def edit
	end

	def update
	end

	def destroy
	end


	private

	def event_parameter
		params.require(:event).permit(:event_title, :start_time)
	end

end