module ApplicationHelper


	def leave_status(status)
			case status
				when 0
				  "Applied"
				when 1
				  "Accepted"
				when 2
				  "Rejected"
			end

	end

	def approved_by_whom(admin_id)
		"Admin"
		admin_id.present? ? "Admin" : "None"
	end

	def leave_taken
			if @user.present?
				 total_leave = System.last.max_leave.present? ? System.last.max_leave : 12
				 leaves_left = total_leave - @user.add_leave_count
				 return leaves_left
			end
	end

	def leave_balance(to_date,from_date)
	 	days = (to_date.to_s.to_date - from_date.to_s.to_date ).to_i
	 	return days
	end



end
