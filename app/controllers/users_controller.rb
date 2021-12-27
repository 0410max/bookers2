class UsersController < ApplicationController
  before_action :correct_user,only: [:edit, :update]

  def show
    @user = User.find(params[:id])
    @book = Book.new
    @books = @user.books
  end

  def index
    @users = User.all
    @user = User.find(current_user.id)
    @book = Book.new
    @user_id = current_user.id
  end

  def edit
    @user = User.find(current_user.id)
  end

  def update
    @user = User.find(params[:id])
    @user.update(user_params)
    if @user.save
      flash[:notice] = "User was successfully updated!"
      redirect_to new_book_path
    else
      render :show
    end
  end

  private

  def user_params
   params.require(:user).permit(:name,:image,:introduction)
  end

  def correct_user
    @user = User.find(params[:id])
    unless @user == current_user
      redirect_to user_path(current_user.id)
    end
  end
end
