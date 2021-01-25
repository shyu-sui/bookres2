class BooksController < ApplicationController
  def new
  end

  def create
   @book = Book.new(book_params)
   @book.user_id = current_user.id
    if @book.save
    redirect_to book_path(@book.id) , notice: 'Book was successfully updated.'
    else
    @books = Book.all
    render :index
    end
  end

  def index
    @book = Book.new
    @books = Book.all
  end

  def show
    @user = current_user
    @book = Book.new
    @books = @user.books
  end

  def edit
  end

  def destroy
  end
  
  private
  def book_params
    params.require(:book).permit(:title, :opinion)
  end
end