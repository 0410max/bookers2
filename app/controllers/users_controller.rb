class UsersController < ApplicationController
  before_action :correct_user,only: [:edit, :update]

  def show
    @book = Book.new
    @user = User.find(params[:id])
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
    @user = User.find(current_user.id)
    @user.update(user_params)
    if @user.save
      flash[:notice] = "User was successfully updated!"
      redirect_to user_path(@user.id)
    else
      render('users/edit')
    end
  end

  private

  def user_params
   params.require(:user).permit(:name,:profile_image,:introduction)
  end

  def correct_user
    @user = User.find(params[:id])
    unless @user == current_user
      redirect_to user_path(current_user.id)
    end
  end
end
