class CommentsController < ApplicationController

	def new
		@event = Event.find(params[:event_id])
		@comment = Comment.new
	end

	def show
		@event = Event.find(params[:event_id])
		@comment = Comment.find(params[:id])
	end

	def create
		@event = Event.find(params[:event_id])
		@comment = Comment.new(comment_params)
		@comment.event_id = @event.id
		@comment.save
		redirect_to event_path(@comment.event_id)
		flash[:success] = "日記を投稿しました。"
	end

	def edit
		@comment = Comment.find(params[:id])
	end

	def update
		@comment = Comment.find(params[:id])
		@comment.update(comment_params)
		redirect_to event_path(@comment.event_id)
		flash[:info] = "日記を投稿しました。"
	end

	def destroy
		@event = Event.find(params[:event_id])
		@comment = Comment.find(params[:id])
		@comment.destroy
		redirect_to event_path(@event.id)
		flash[:danger] = "日記を削除しました。"
	end

	private

	def comment_params
		params.permit(:comment, user: [:name, :user_image_id])
	end

end
