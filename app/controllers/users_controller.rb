class UsersController < ApplicationController

before_action :authenticate_user!

before_action :ensure_correct_user, {only: [:show, :edit, :update, :destroy]}

  def ensure_correct_user
    if params[:id].to_i != current_user.id
        redirect_to user_path(current_user.id)
        flash[:danger] = "アクセス権限がありません。"
    end
  end

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
	  	if @user.update(user_params)
		  	redirect_to user_path(@user.id)
		  	flash[:info] = "ユーザー情報が変更されました。"
	  	else
	  		redirect_to edit_user_path(@user.id)
	  		flash[:danger] = '登録情報に誤りがあります。'
	  	end
	end

	def group_show
		@user = User.find(params[:id])
		@group_users = GroupeUser.where(user_id: current_user)
	end

	def destroy
		@user =  User.find(params[:id])
		@user.destroy
		redirect_to root_path
	end

	private
	def user_params
		params.require(:user).permit(:name, :email, :search_number, :user_image_id)
    end


end