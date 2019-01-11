class EventsController < ApplicationController

	def new
		@events = Event.new
	end

	def show
	end

	def create
		Event.create(event_parameter)
		redirect_to user_path
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