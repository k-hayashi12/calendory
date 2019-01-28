class GroupEventsController < ApplicationController

	def new
		@group_event = GroupEvent.new
	end

	def create
		@group = Group.find(params[:group_id])
		@group_event = GroupEvent.new(group_event_params)
		@group_event.group_id = @group.id
		if @group_event.save
			redirect_to group_path(@group_event.group_id)
			flash[:success] = "イベントを登録しました。"
		else
			redirect_to new_event_path(@event.id)
			flash[:danger] = "イベント名を入力してください。"
		end
	end

	def show
		@group_event = GroupEvent.find(params[:id])
	end

	def edit
		@group_event = GroupEvent.find(params[:id])
	end

	def update
		@group_event = GroupEvent.find(params[:id])
		if @group_event.update(group_event_params)
			redirect_to group_event_path(@group_event.id)
			flash[:info] = "イベント名を変更しました。"
		else
			redirect_to edit_group_event_path(@group_event.id)
			flash[:danger] = "イベント名を入力してください。"
		end
	end

	def destroy
		@group_event = GroupEvent.find(params[:id])
		@group_event.destroy
		redirect_to group_path(@group_event.group_id)
		flash[:danger] = "グループのイベントを削除しました。"
	end


	private

	def group_event_params
		params.require(:group_event).permit(:group_event_title, :start_time)
	end
end
