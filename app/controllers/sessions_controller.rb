class SessionsController < ApplicationController

	def new 
	end

	def create 
		user = User.find_by(email: params[:session][:email].downcase)
		if user && user.authenticate(params[:session][:password])
			#login user
			redirect books_path
		else
			flash.now[:error] = 'Invalid email or password'
			render 'new'
		end
	end

	def destroy 
	end
end
