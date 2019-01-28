class GroupUsersController < ApplicationController

	def new
	end

	def create
		@user = User.find(params[:id])
		@group = Group.find_by(group_name: params[:GroupeUser][:group_id])
		a = GroupeUser.where(user_id: @user.id, group_id: @group.id)
		if a.exists?
			redirect_to group_show_path
			flash[:danger] = "招待済みユーザーです"
		else
		@groupe_user = GroupeUser.create(user_id: @user.id, group_id: @group.id)
		redirect_to group_path(@group.id)
		flash[:success] = "#{@user.name}を#{@group.group_name}に招待しました。"
		end
	end

	def index
		@users = User.search(params[:search])
	end

	def destroy
		@group = Group.find(params[:id])
		@user = User.find(params[:user_id])
		@group_user = GroupeUser.find_by(group_id: @group, user_id: @user)
		@group_user.destroy
		redirect_to group_path
		flash[:danger] = "#{@user.name}が#{@group.group_name}から退室しました。"
	end

	private
	def search_params
		# params.require(:search).permit(:name, :email, :search_number)
    end

end
