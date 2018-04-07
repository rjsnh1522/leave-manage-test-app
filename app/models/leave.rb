class Leave < ApplicationRecord
	belongs_to :user

	 validates :from_date,:to_date,:reason, :presence => true
	 
	validate  :date_correctness
	 validate :leave_balance

	 def date_correctness
		 	unless self.from_date > DateTime.now  || self.to_date > DateTime.now
		 		 errors.add(:to_date,"Please select valid date")
		 	end
	 end

	 def leave_balance
	 	days = (self.to_date.to_s.to_date - self.from_date.to_s.to_date ).to_i
	 	unless days > 0
 		 errors.add(:from_date,"Please select valid date")
	 	end
	 end
end
