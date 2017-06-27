class RoomController < ApplicationController
	include SessionHelper
	before_action :logged_in_user, only: [:edit, :update, :index, :destroy, :following, :followers]
	def index
		@rooms = current_user.rooms
	end

	def get_rooms
		rooms = Room.where(:roomcategory_id => params[:category])
		render :json => rooms
	end
end
