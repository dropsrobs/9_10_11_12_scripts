class BooksController < ApplicationController
  before_action :fetch_book, only: %i(show edit update)

  def show
  end

  def new
    @book = Book.new
  end

  def create
    @book = Book.new(book_params)
    if @book.save
      redirect_to authors_path
    else
      render 'new'
    end
  end

  def edit
  end

  def update
    if @book.update(book_params)
      redirect_to @book
    else
      render 'edit'
    end
  end

  private

  def book_params
    params.require(:book).permit(:title, :edition, author_ids: [])
  end

  def fetch_book
    @book = Book.find(params[:id])
  end
end
