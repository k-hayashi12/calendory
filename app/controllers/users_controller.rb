class UsersController < ApplicationController

	def show
		@user = User.find(params[:id])
		@events = Event.where(user_id: @user.id)
		@group_users = GroupeUser.where(user_id: @user.id)
	end

	def edit
		@user = User.find(params[:id])
	end

	def update
    	@user = User.find(params[:id])
	  	@user.update(user_params)
	  	redirect_to user_path(@user.id)
	end

	def group_show
		@user = User.find(params[:id])
		@group_users = GroupeUser.where(user_id: current_user)
	end

	private
	def user_params
		params.require(:user).permit(:name, :email, :search_number, :user_image_id)
    end

end