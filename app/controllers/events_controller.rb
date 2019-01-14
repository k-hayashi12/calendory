class EventsController < ApplicationController

	def new
		@event = Event.new
	end

	def show
		@event = Event.find(params[:id])
	end

	def create
		@event = Event.new(event_params)
		@event.user_id = current_user.id
		@event.save
		redirect_to user_path(@event.user_id)
	end

	def edit
		@event = Event.find(params[:id])
	end

	def update
		@event = Event.find(params[:id])
		@event.update(event_params)
		redirect_to event_path(@event.id)
	end

	def destroy
	end


	private

	def event_params
		params.require(:event).permit(:event_title, :start_time)
	end

end