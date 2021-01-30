class UsersController < ApplicationController
  before_action :authenticate_user!
  def index
    @users = User.all
    @user = current_user
    @book = Book.new
  end

   def show
    @user = current_user
    @username = User.find(params[:id])
    @book = Book.new
    @books = @user.books
   end

  def new
    @book = Book.new
  end

  def create
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    @user.update(user_params)
    if @user.update(user_params)
      redirect_to user_path(@user.id) , notice: 'Book was successfully updated.'
    else
      render :edit
    end
  end

  def about
  end

  private
  def user_params
    params.require(:user).permit(:name, :profile_image, :introduction)
  end

end

