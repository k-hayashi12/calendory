class GroupEventsController < ApplicationController

	def new
		@group_event = GroupEvent.new
	end

	def create
		@group = Group.find(params[:group_id])
		@group_event = GroupEvent.new(group_event_params)
		@group_event.group_id = @group.id
		@group_event.save
		redirect_to group_path(@group_event.group_id)
	end

	def show
		@group_event = GroupEvent.find(params[:id])
	end

	def edit
		@group_event = GroupEvent.find(params[:id])
	end

	def update
		@group_event = GroupEvent.find(params[:id])
		@group_event.update(group_event_params)
		redirect_to group_event_path(@group_event.id)
	end

	def destroy
	end


	private

	def group_event_params
		params.require(:group_event).permit(:group_event_title, :start_time)
	end
end
