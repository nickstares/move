class FollowsController < ApplicationController

	before_action :authenticate_user!

	def followers
		@followers = User.find(params[:id]).followers

		puts @followers.inspect
	end

	def followed
		@followed = User.find(params[:id]).followed_users
	end

	def create
		@user = User.find(params[:user_id])
		@follow = current_user.follow!(@user)

		if @follow
			respond_to do |format|
				format.html { redirect_to @user }
			end 
		end
	end

	def destroy
		@user = User.find(params[:user_id])
		@unfollow = Follow.find_by(followed_id:@user.id, follower_id: current_user.id).destroy

		if @unfollow
			respond_to do |format|
				format.html { redirect_to @user }
			end 
		end
	end
end