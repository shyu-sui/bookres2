class UsersController < ApplicationController
  
  def index
    @books = Book.new
    @books = Book.all
  end

   def show
    @user = User.find(params[:id])
    @post_images = @user.post_images.page(params[:page]).reverse_order
   end

  def new
    @book = Book.new
  end

  def create
    @book = Book.new(book_params)
    if @book.save
    redirect_to user_path(@book.id) , notice: 'Book was successfully updated.'
    else
    @books = Book.all
    render :index
    end
  end

  def edit
  end

  def about
  end

  private
  def book_params
    params.require(:book).permit(:title, :body)
  end
end

