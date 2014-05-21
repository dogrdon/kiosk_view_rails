class UsersController < ApplicationController

	before_action :logged_in_user, only: [:index, :edit, :update, :destroy]
	before_action :correct_user, only: [:edit, :update]
	before_action :admin_user, only: :destroy


	def new
		@user = User.new
	end


	def create
		@user = User.new(user_params)
		if @user.save
			login(@user)
			flash[:success] = "New user login created."
			redirect_to books_path
		else
			flash.now[:error] = "New User Creation Failed!"
			render 'new'
		end
	end

	def edit
		#@user = User.find(params[:id]) # no need, defined in before_action
	end

	def update
		#@user = User.find(params[:id]) # no need, defined in before_action
		if @user.update_attributes(user_params)
			flash[:success] = "User account updated"
			redirect_to root_url
		else
			render 'edit'
		end
		
	end

	def destroy
		User.find(params[:id]).destroy
		flash[:success] = "User deleted."
		redirect_to users_url
		
	end

	def index
		@users = User.all
	end

	private

		def user_params
			params.require(:user).permit(:name, :email, :password, :password_confirmation)
		end

		def logged_in_user
			unless logged_in?
				store_location
				redirect_to login_path, notice: "Please log in."
			end
		end

		def correct_user
			@user = User.find(params[:id])
			redirect_to(root_url) unless current_user?(@user)
		end

		def admin_user
			redirect_to(root_url) unless current_user.admin?

		end

end
