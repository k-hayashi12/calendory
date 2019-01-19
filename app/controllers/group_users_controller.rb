class GroupUsersController < ApplicationController

	def new
	end

	def create
	end

	def index
		@users = User.search(params[:search])
	end

	def destroy
	end

end
