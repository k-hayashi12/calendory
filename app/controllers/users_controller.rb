class UsersController < ApplicationController

	def show
		@user = User.find(params[:id])
		@events = Event.all
	end

	def edit
	end

	def update
	end

end