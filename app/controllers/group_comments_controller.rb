class GroupCommentsController < ApplicationController

	def new
		@group_event = GroupEvent.find(params[:group_event_id])
		@group_comment = GroupComment.new
	end

	def show
		@group_event = GroupEvent.find(params[:group_event_id])
		@group_comment = GroupComment.find(params[:id])
	end

	def create
		@group_event = GroupEvent.find(params[:group_event_id])
		@group_comment = GroupComment.new(group_comment_params)
		@group_comment.user_id = current_user.id
		@group_comment.group_event_id = @group_event.id
		@group_comment.save
		redirect_to group_event_path(@group_comment.group_event_id)
		flash[:success] = "日記を投稿しました。"
	end

	def edit
		@group_comment = GroupComment.find(params[:id])
	end

	def update
		@group_comment = GroupComment.find(params[:id])
		@group_comment.update(group_comment_params)
		redirect_to group_event_path(@group_comment.group_event_id)
		flash[:info] = "日記を編集しました。"
	end

	def destroy
		@group_event = GroupEvent.find(params[:group_event_id])
		@group_comment = GroupComment.find(params[:id])
		@group_comment.destroy
		redirect_to group_path(@group_event.id)
		flash[:danger] = "日記を削除しました。"
	end


	private

	def group_comment_params
		params.permit(:group_comment, user: [:name, :user_image_id], group: [:group_name])
	end

end
