ActiveAdmin.register Leave do
# See permitted parameters documentation:
# https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
#
# permit_params :list, :of, :attributes, :on, :model
#
# or
#
# permit_params do
#   permitted = [:permitted, :attributes]
#   permitted << :other if params[:action] == 'create' && current_user.admin?
#   permitted
# end


	show do 
		render 'show'
	end

	controller do 

		def leave_status
			if params[:id].present?
				leave = Leave.all.where(id:params[:id]).last
				days = leave_balance(leave.to_date,leave.from_date)
				user = User.find_by_id(leave.user_id) if leave.present?
				if params[:status] == "accept"
					leave.update_attributes(status:1,approved_by:current_admin_user.id)
					user.update_attributes(add_leave_count:user.add_leave_count + days)
				end
				if params[:status] == "reject"
					leave.update_attributes(status:2,approved_by:current_admin_user.id)
					if user.add_leave_count > 0
						leave_le =  user.add_leave_count - days < 0 ? 0 : user.add_leave_count - days
						user.update_attributes(add_leave_count:leave_le)
					end
				end
			end
			render :index
		end


		def leave_balance(to_date,from_date)
	 	days = (to_date.to_s.to_date - from_date.to_s.to_date ).to_i
	 	return days
	end

	end

end
