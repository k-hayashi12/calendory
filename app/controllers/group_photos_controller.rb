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
		flash[:info] = "写真を投稿しました。"
	end

	def index
		@group_event = GroupEvent.find(params[:group_event_id])
	end

	def destroy
		@group_photo = GroupPhoto.find(params[:id])
		@group_event = @group_photo.group_event
		@group_photo.destroy
		redirect_to group_event_path(@group_event.id)
		flash[:danger] = "写真を削除しました。"
	end


	private

	def group_photo_params
		params.permit(:group_photo_image_id)
	end
end
