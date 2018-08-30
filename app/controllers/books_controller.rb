class BooksController < ApplicationController
  def index
  end

  def index
    @books = Book.all
  end
  def show
    @book = Book.find(params[:id])
    @comments = @book.comments
    @comment = @book.comments.new
  end

  def new
    @book = Book.new
  end

  def create
    @book = Book.new(book_params)
    @book.user_id = current_user.id
    if(@book.save)
      redirect_to book_path(@book)
    else
      render 'new'
    end
  end

  private

  def book_params
    params.require(:book).permit(:name,:description)
  end
end
