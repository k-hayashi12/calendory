class GroupPhotosController < ApplicationController

	def new
		@group_event = GroupEvent.find(params[:group_event_id])
		@group_photo = GroupPhoto.new
	end

	def show
	end

	def create
		@group_event = GroupEvent.find(params[:group_event_id])
		@group_photo = GroupPhoto.new(group_photo_params)
		@group_photo.group_event_id = @group_event.id
		@group_photo.save
		redirect_to group_event_path(@group_photo.group_event_id)
	end

	def index
	end

	def destroy
	end

	private

	def group_photo_params
		params.permit(:group_photo_image_id)
	end
end
