class LeavesController < ApplicationController
	before_action :authenticate_user!
	def index 
		@all_leaves = @user.leaves
	end 

	def new
		@leave = Leave.new
	end

	def create
		begin

		@leave = @user.leaves.create!(leave_params)
		rescue Exception => e
			flash[:alert] = e.message
		end
		redirect_to leaves_path
	end


	private

	def leave_params
		params.require(:leave).permit(:from_date,:to_date,:reason)
	end

end
