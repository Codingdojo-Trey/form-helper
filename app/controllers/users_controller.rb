class UsersController < ApplicationController
  def index
  	@users = User.all
  end

  def create
  		user = User.new(user_params)
  		if user.valid?
  			user.save
  			flash[:notice] = "new user successfully created"
  			redirect_to(users_path)
  		else
  			flash[:errors] = user.errors.full_messages
  			redirect_to(new_user_path)
  		end
  end

  def new
  	@user = User.new
  end

  private

  def user_params
  	params.require(:user).permit(:first_name, :last_name, :email, :password)
  end
end
