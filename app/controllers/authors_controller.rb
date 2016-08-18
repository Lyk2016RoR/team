class AuthorsController < ApplicationController
  def new
    @author = Author.new
  end

  def index
    @authors = Author.all
  end

  def show
    @author = Author.find(params[:id])
  end

  def create

  end


private


  def author_params
    params.require(:author).permit(:name)
  end
end
