class CommentsController < ApplicationController

	def new
		@event = Event.find(params[:event_id])
		@comment = Comment.new
	end

	def show
		@event = Event.find(params[:id])
	end

	def create
		@event = Event.find(params[:event_id])
		@comment = Comment.new(comment_params)
		@comment.event_id = @event.id
		@comment.save
		redirect_to event_path(@comment.event_id)
	end

	def edit
	end

	def update
	end

	def destroy
	end

	private

	def comment_params
		params.permit(:comment)
	end

end
