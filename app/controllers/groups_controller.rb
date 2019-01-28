class GroupsController < ApplicationController


	def new
		@group = Group.new
	end

	def create
		@group = Group.new(group_params)
		if @group.save
			@groupe_user = GroupeUser.create(user_id: current_user.id, group_id: @group.id)
			redirect_to group_path(@group.id)
			flash[:success] = "#{@group.group_name}が作成されました。"
		else
			redirect_to new_group_path(@group.id)
			flash[:danger] = "無記入の状態では登録できません。"
		end
	end

	def show
		@group = Group.find(params[:id])
		@group_events = GroupEvent.where(group_id: @group)
		@user = @group.users
		@group_users = GroupeUser.where(group_id: @group.id)
	end

	def index
		@users = User.search(params[:search])
		if @users.blank?
			flash.now[:success] = "検索用IDは正確に入力してください。"
		end
	end

	def edit
		@group = Group.find(params[:id])
	end

	def update
		@group = Group.find(params[:id])
	  	if @group.update(group_params)
	  		redirect_to group_path(@group.id)
	  		flash[:info] = "グループ名が#{@group.group_name}に変更されました。"
	  	else
	  		redirect_to edit_group_path(@group.id)
	  		flash[:danger] = flash[:danger] = "無記入の状態では登録できません。"
	  	end
	end

	def destroy
		@group = Group.find(params[:id])
		@group.destroy
		redirect_to user_path(current_user)
		flash[:danger] = "#{@group.group_name}を削除しました。"
	end


	private

	def group_params
		params.require(:group).permit(:group_name)
	end

end
