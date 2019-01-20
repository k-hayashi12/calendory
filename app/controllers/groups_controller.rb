class GroupsController < ApplicationController

	def new
		@group = Group.new
	end

	def create
		@group = Group.new(group_params)
		if @group.save
			@groupe_user = GroupeUser.create(user_id: current_user.id, group_id: @group.id)
		end
		redirect_to group_path(@group.id)
	end

	def show
		@group = Group.find(params[:id])
		@group_events = GroupEvent.where(group_id: @group)
		@user = @group.users
		@group_users = GroupeUser.where(group_id: @group.id)
	end

	def edit
		@group = Group.find(params[:id])
	end

	def update
		@group = Group.find(params[:id])
	  	@group.update(group_params)
	  	redirect_to group_path(@group.id)
	end

	def destroy
	end


	private

	def group_params
		params.require(:group).permit(:group_name)
	end

end
