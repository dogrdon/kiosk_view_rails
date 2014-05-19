class UsersController < ApplicationController
	def new
		@user = User.new
	end


	def create
		@user = User.new(user_params)
		if @user.save
			flash[:success] = "New user login created."
			redirect_to books_path
		else
			flash.now[:error] = "New User Creation Failed!"
			render 'new'
		end
	end

	private

		def user_params
			params.require(:user).permit(:name, :email, :password, :password_confirmation)
		end
end
