class Rsvp < ActiveRecord::Base 
	belongs_to :user
	belongs_to :event
        
	validates_presence_of :user_id, :event_id, :rsvp_status
        validates :user_id, uniqueness: true

	# corresponding numbers...
	RSVP_STATUSES = {
		:attending => 1,
		:maybe => 2,
		:not_attending => 3
	}

end 
