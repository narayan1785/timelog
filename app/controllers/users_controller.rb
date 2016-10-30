class UsersController < ApplicationController
  
  def index

  end

  def new
    @user = User.new
  end

  def create
     @user = User.new(user_params)
     if @user.valid?
       @user.save
       redirect_to sessions_path, notice: "Signed Up successfully"
     else
     	render :new
     end
  end
  
  private
  
  def user_params
    params.require(:user).permit(:username)
  end
end
