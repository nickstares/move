class UsersController < ApplicationController

	# before_action :authenticate_user!
	
	def index
		@users = User.all.order(:username)
	end

	def search
		if params[:search]
    @users = User.search(params[:search]).order("created_at DESC")
	  else
	    @users = User.all.order('created_at DESC')
	  end
	end

	def show
		@user = User.find(params[:id])
		@events = Event.where(user_id: @user.id)
		# refactor this to use join/include
		@rsvps = Rsvp.where(:user_id => current_user.id, :rsvp_status => 1)

		@events = @events.sort_by &:event_time
		@events.reverse!
	end

	def edit
		@user = User.find(params[:id])
	end

	def update
		@user = User.find(params[:id])
		@user.update(user_params)

		if @user.save
			respond_to do |format|
				format.html { redirect_to @user  }
				format.json { render json: @user, status: 200 }
			end
		end
	end

	def delete
		@user = User.find(params[:id])
		@events = Event.where(user_id: params[:id])
		@user.destroy
		@events.delete
	end

	private 

	def user_params
		params.require(:user).permit(:username, :profile_photo, :email, :password, :password_confirmation, :bio, :personal_website)
	end
end