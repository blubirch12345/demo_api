class UsersController < ApplicationController
	before_action :authenticate_user!, except: [:index]

	def index
		@users = User.all
		render json: @users
	end

	def show
		render json: @user, status: :ok
	end

	def update
		if @user.update
			render json: { id: @user_id, message: "User updated successfully" }, status: :ok
		else
			render json: { error: "Failed to update" }, status: :unprocessable_entity
		end
	end

	def destroy
		render json: @users
	end
end
