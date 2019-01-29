class EventsController < ApplicationController

	def new
		@event = Event.new
	end

	def show
		@event = Event.find(params[:id])
	end

	def create
		@event = Event.new(event_params)
		@event.user_id = current_user.id
		if @event.save
			redirect_to user_path(@event.user_id)
			flash[:success] = "イベントを登録しました。"
		else
			redirect_to new_event_path(@event.id)
			flash[:danger] = "イベント名を入力してください。"
		end
	end

	def edit
		@event = Event.find(params[:id])
	end

	def update
		@event = Event.find(params[:id])
		if @event.update(event_params)
			redirect_to event_path(@event.id)
			flash[:info] = "イベント名を変更しました。"
		else
			redirect_to edit_event_path(@event.id)
			flash[:danger] = "イベント名を入力してください。"
		end
	end

	def destroy
		@event = Event.find(params[:id])
		@event.destroy
		redirect_to user_path(@event.user_id)
		flash[:danger] = "イベントを削除しました。"
	end


	private

	def event_params
		params.require(:event).permit(:event_title, :start_time)
	end

end