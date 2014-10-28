class Follow < ActiveRecord::Base 
	belongs_to :follower, class_name: "User"
	belongs_to :followed, class_name: "User"

	validates_presence_of :followed_id, :follower_id
end 