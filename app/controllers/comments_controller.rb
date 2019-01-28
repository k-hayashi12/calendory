class CommentsController < ApplicationController

before_action :authenticate_user!

before_action :ensure_correct_user, {only: [:show, :edit, :update, :destroy]}

  	def ensure_correct_user
  		
  	 	if @events.comment.user.id != current_user.id
      	  redirect_to user_path(current_user.id)
      	  flash[:danger] = "権限がありません。"
    	end
  	end

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
		if @comment.save
			redirect_to event_path(@comment.event_id)
			flash[:success] = "日記を投稿しました。"
		else
			redirect_to new_event_comment_path(@event.id)
			flash[:danger] = "文字数は1~400字以内で入力してください。"
		end
	end

	def edit
		@comment = Comment.find(params[:id])
	end

	def update
		@comment = Comment.find(params[:id])
		if @comment.update(comment_params)
			redirect_to event_path(@comment.event_id)
			flash[:info] = "日記を編集しました。"
		else
			redirect_to edit_event_comment_path(@comment.id)
			flash[:danger] = "文字数は1~400字以内で入力してください。"
		end
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
