class SessionsController < ApplicationController
	before_action :authenticate_user!, only: [:destroy]

	def new

	end

	def create 
		user = User.find_by(email: params[:email])

		if user && user.authenticate(params[:password])
			session[:user_id] = user.id 
			redirect_to :root, :notice => "Welcome back, #{user.email}!"
		else
			flash[:alert] = "Invalid email or password"
			render :new
		end
	
	end

	def destroy
		session[:user_id] = nil 
		redirect_to :root, :notice => "You are now logged out"
	end
end


