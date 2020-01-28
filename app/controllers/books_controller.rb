class BooksController < ApplicationController
before_action :ensure_correct_user, only: [:edit, :destroy]

  def index
  	@books = Book.all
  	@book = Book.new
  	@user = current_user
  end

  def show
  	@book = Book.find(params[:id])
  	@user = @book.user
  	@booknew = Book.new
  end
  

  def edit
  	@book = Book.find(params[:id])
  	@user = current_user
  end
  def create
  	@user = current_user
  	@book = Book.new(book_params)
  	@book.user_id = current_user.id
		if @book.save
			redirect_to book_path(@book.id)
			flash[:notice]='User info was successfully created'
		else
			@books = Book.all
			render :index
		end
  end
  def destroy
  	book = Book.find(params[:id])
  	book.destroy
  	redirect_to books_path
  end
  def update
  	@book = Book.find(params[:id])
		if @book.update(book_params)
		redirect_to book_path(@book)
		flash[:notice]='User Info was successfully updated'
	else
		render :edit
	end
  end
  # def ensure_correct_user
  #   if @current_user != params[:id].to_i
  #     redirectsr_to user_path(current_user)
  #   end
  # end

  private
  def book_params
		params.require(:book).permit(:title, :body)
	end
  def ensure_correct_user
    book = Book.find(params[:id])
      if current_user.id != book.user_id
        redirect_to books_path
      end
  end
end
