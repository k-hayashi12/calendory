class PhotosController < ApplicationController

	def new
		@event = Event.find(params[:event_id])
		@photo = Photo.new
	end

	def create
		@event = Event.find(params[:event_id])
		@photo = Photo.new(photo_params)
		@photo.event_id = @event.id
		@photo.save
		redirect_to event_path(@photo.event_id)
		flash[:success] = "写真が投稿されました。"
	end

	def index
		@event = Event.find(params[:event_id])
	end

	def destroy
		@photo = Photo.find(params[:id])
		@event = @photo.event
		@photo.destroy
		redirect_to event_path(@event.id)
		flash[:danger] = "写真を削除しました。"
	end

	private

	def photo_params
		params.permit(:photo_image_id)
	end

end

