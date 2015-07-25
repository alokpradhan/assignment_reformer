class UsersController < ApplicationController

def new
	@user = User.new
end

def create
	@user = User.new(whitelist_new_user_input)
	if @user.save
		redirect_to user_path(@user)
	else
		render :new
	end
end

def show
end

private

def whitelist_new_user_input
	if params.class == Array

	else
		params.require(:user).permit(:username, :email, :password)
	end
end

end
