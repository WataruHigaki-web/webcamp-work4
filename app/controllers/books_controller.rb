class BooksController < ApplicationController
  def new
  end

  def index
  	@books = Book.all
  	@book = Book.new
  	@user = User.find(current_user.id)
  end

  def show
  	@book = Book.find(params[:id])
  	@user =User.find(current_user.id)
  end

  def edit
  	@book = Book.find(params[:id])
  	@user =User.find(current_user.id)
  end
  def create
  	@book = Book.new(book_params)
  	@book.user_id = current_user.id
		if @book.save
			redirect_to book_path(@book.id)
			flash[:notice]='User info was successfully created'
		else
			@books = Book.all
			flash[:notice] = "can't be blank"
			render :index
		end
  end
  def destroy
  	book = Book.find(params[:id])
  	book.destroy
  	redirect_to books_path
  end
  private
  def book_params
		params.require(:book).permit(:title, :option)
	end
end
