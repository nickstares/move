class RsvpsController < ApplicationController

	before_action :authenticate_user!

	def rsvped
		@rsvped = User.find(params[:id]).rsvped_events
	end

	def create
		
		@event = Event.find(params[:event_id])

		@rsvp = Rsvp.new(:user_id => current_user.id, :event_id => params[:event_id], :rsvp_status => params[:rsvp_status])

		if @rsvp.save
			respond_to do |format|
				format.json { render :json => @rsvp }
			end 
		else
			respond_to do |format|
				format.json { render :nothing => true, :status => 400 }
			end
		end


	end

	def destroy
		@unrsvp = Rsvp.find_by(:user_id => current_user.id, :event_id => params[:event_id]).destroy

		if @unrsvp
			respond_to do |format|
				format.html { redirect_to @event }
			end 
		end
	end

end