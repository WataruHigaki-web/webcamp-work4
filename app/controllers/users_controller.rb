class UsersController < ApplicationController
	def top
		
	end
	def show
		@user = User.find(params[:id])
		@books = @user.books
		@book = Book.new

	end
	def index 
		@users = User.all
		@user = current_user
		@book = Book.new
	end
	def edit
		@user = User.find(params[:id])
	end
	def update
		@user = User.find(params[:id])
		if @user.update(user_params)
		redirect_to user_path(user.id)
		flash[:notice]='User Info was successfully updated'
	else
		render :edit
	end
	end
	def new
		@user = User.new
	end
	
	def about
		
	end


	private
	def user_params
		params.require(:user).permit(:name, :profile_image, :introduction)
	end

end
