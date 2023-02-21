class UsersController < ApplicationController
	before_action :authenticate_user!, except: [:index]

	def index
		@users = User.all
		render json: @users
	end

	def show
		render json: @user, status: :ok
	end

	def destroy
		render json: @users
	end


end
