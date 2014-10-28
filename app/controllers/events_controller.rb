class EventsController < ApplicationController

	before_action :authenticate_user!

	def index
		@followed_ids = Follow.where(follower_id: current_user.id).select(:followed_id).map(&:followed_id)
		
		@events = Event.where(user_id: @followed_ids).order(:created_at)
		@my_events = Event.where(user_id: current_user.id)
		@my_events.each do |x|
			@events.push x
		end

		@events = @events.sort_by &:created_at
		@events.reverse!
	end

	def new
		@event = Event.new
	end

	def show
		@event = Event.find(params[:id])
	end

	def create
		@event = Event.new(post_params)
		@event.user_id = current_user.id

    if @event.save
    	respond_to do |f|
    		f.html {redirect_to root_path}
  			f.json {render json: @event}
  		end
    else
      respond_to do |f|
	      f.html {redirect_to root_path}
    		f.json {render status: 400, nothing: true}
    	end
    end
	end

	def delete
		@event = Event.find(params[:id])
	end


	private

		def post_params
			params.require(:event).permit(:name, :event_photo, :description, :event_time, :age_limit, :link)
		end
end