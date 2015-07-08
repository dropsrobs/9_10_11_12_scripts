class AuthorsController < ApplicationController
  def show
    @author = Author.find(params[:id])
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
    @author = Author.find(params[:id])
  end

  def update
    @author = Author.find(params[:id])

    if @author.update(author_params)
      redirect_to @author
    else
      render 'edit'
    end
  end

  def destroy
    @author = Author.find(params[:id])
    @author.books.each do |book|
      book.destroy if book.authors.count == 1
    end
    @author.destroy

    redirect_to authors_path
  end

  def index
    @author = Author.all
  end

  private
    def author_params
      params.require(:author).permit(:name, :surname, :book_ids => [])
    end
end
