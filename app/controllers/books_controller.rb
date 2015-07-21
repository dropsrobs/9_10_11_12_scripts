class BooksController < ApplicationController
  before_action :fetch_book, only: %i(show edit update destroy)

  def list
    @book = Book.all
    respond_to do |format|
      format.json { render json: @book }
    end
  end

  def show
    answer_format
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

  def destroy
    @book.delete
    render json: ''.as_json
  end

  private

  def book_params
    params.require(:book).permit(:title, :edition, author_ids: [])
  end

  def fetch_book
    @book = Book.find(params[:id])
    rescue ActiveRecord::RecordNotFound
      render json: { error: 'Book does not exist' }, status: :bad_request
  end

  def answer_format
    respond_to do |format|
      format.html
      format.json { render json: @book }
    end
  end
end
