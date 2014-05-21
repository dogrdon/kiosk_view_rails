class SessionsController < ApplicationController

	def new 
	end

	def create 
		user = User.find_by(email: params[:session][:email].downcase)
		if user && user.authenticate(params[:session][:password])
			login(user)
			flash[:success] = 'Thanks, you are now logged in'
			redirect_back_or books_path
		else
			flash.now[:error] = 'Invalid email or password'
			render 'new'
		end
	end

	def destroy 
		log_out
		redirect_to root_url
	end
end
