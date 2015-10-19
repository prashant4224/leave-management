class Scoot < ActiveRecord::Base
	belongs_to :user

	scope :accepted_leaves, -> { where("state = ?", 'accepted')}
	scope :rejected_leaves, -> { where("state = ?", 'rejected')}

def self.show_leaves(user)
	if user.role == 'manager'
		where(state: 'pending')
	else
		where(user_id: user.id)
	end
end

def duration
	only_weekdays(leave_from..leave_to)
end

protected

def only_weekdays(range)
	range.select { |d| (1..5).include?(d.wday) }.size
end

end
