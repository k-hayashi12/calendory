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

	private
	def search_params
		# params.require(:search).permit(:name, :email, :search_number)
    end

end
