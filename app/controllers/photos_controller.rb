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
	end

	def index
		@event = Event.find(params[:event_id])
	end

	def destroy
		@event = Event.find(params[:event_id])
		@photo = Photo.find(params[:id])
		@photo.destroy
		redirect_to event_path(@event.id)
	end

	private

	def photo_params
		params.permit(:photo_image_id)
	end

end

