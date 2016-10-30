class SessionsController < ApplicationController

  def index
  end

	def create
	  @user = User.authenticate(params[:user_name])
    if @user.present?
      @user.checkin_user 
      session[:user_id] = @user.id
      redirect_to dashboards_path, notice: "In Time registered successfully"
    else
    	redirect_to sessions_path, alert: "Please enter a registered username"
    end
	end

	def destroy
	  session[:user_id] = nil
	  redirect_to root_path
	end
end
