class BooksController < ApplicationController

  def index
    @books = Book.all
    @user = current_user
    @book = Book.new
    @user_id = current_user.id
    @user = User.find(@user_id)
  end

  def create
    @book= Book.new(book_params)
    @book.user_id = current_user.id
    if @book.save
      redirect_to book_path(@book)
      flash[:notice] = "Book was successfuly created!"
    else
      @books = Book.all
      @user = current_user
      @user_id = current_user.id
      @user = User.find(@user_id)
      render :index
    end
  end

  def show
    @book = Book.find(params[:id])
    @new_book = Book.new
  end

  def edit
    @book = Book.find(params[:id])
  end

  def update
    @book = Book.find(params[:id])
    @book.update(book_params)
    if @book.save
      flash[:notice] = "Book was successfully updated!"
      redirect_to book_path(@book.id)
    else
      render :show
    end
  end

  def destroy
    book = Book.find(params[:id])
    book.destroy
    flash[:notice] = "Book was successfully destroyed!"
    redirect_to books_path
  end

  private

  def book_params
    params.require(:book).permit(:book_title, :opinion)
  end
end
