class AuthorsController < ApplicationController
  before_action :fetch_author, only: %i(show edit update destroy)

  def show
  end

  def new
    @author = Author.new
  end

  def create
    @author = Author.new(author_params)
    if @author.save
      redirect_to @author
    else
      render 'new'
    end
  end

  def edit
  end

  def update
    if @author.update(author_params)
      redirect_to @author
    else
      render 'edit'
    end
  end

  def destroy
    @author.books.each do |book|
      book.destroy if book.single_author?
    end
    @author.destroy

    redirect_to authors_path
  end

  def index
    @author = Author.all
  end

  private

  def author_params
    params.require(:author).permit(:name, :surname, book_ids: [])
  end

  def fetch_author
    @author = Author.find(params[:id])
  end
end
