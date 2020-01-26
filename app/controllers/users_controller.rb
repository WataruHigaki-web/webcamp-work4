class UsersController < ApplicationController
	def top
	end
	def show
		# @books = current_user.book.find(params[:id])
		@user = User.find(params[:id])
		@books = @user.books
		@book = Book.new

	end
	def index 
		@users = User.all
		@user = User.find(current_user.id)
		@book = Book.new
		


	end
	def create
		user = User.new(user_params)
		if user.save
			redirect_to book_path(user.id)
			flash[:notice]='User info was successfully created'
		else
			@users = User.all
			@user = User.new
			flash[:notice] = "can't be blank"
			render :edit
		end

	end
	def edit
		@user = User.find(params[:id])
	end
	def update
		user = User.find(params[:id])
		if user.update(user_params)
		redirect_to user_path(user.id)
		flash[:notice]='User Info was successfully updated'
	else
		@users = User.all
		@user = User.find(user.id)
		flash[:notice] = "can't be blank"
		render :edit
	end
	end
	def new
		@user = User.new
	end
	def home
	end


	private
	def user_params
		params.require(:user).permit(:name, :profile_image, :introduction, :user_id)
	end

end
