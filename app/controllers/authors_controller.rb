class AuthorsController < ApplicationController
  def show
    @author = Author.find(params[:id])
  end

  def new
    @author = Author.new
  end

  def create
    @author = Author.new(author_params)
    @author.save
    redirect_to @author
  end

  private
    def author_params
      puts params.inspect
      params.require(:author).permit(:name, :surname)
    end
end
