class AuthorsController < ApplicationController
  def new
    @author = Author.new
  end

  def index
    @authors = Author.all
  end

  def show
    set_author
  end

  def create
    @author = Author.new(author_params)

    if @author.save
      redirect_to author_path(@author), notice: "Author Saved"
    end
  end

  def edit
    set_author
  end

  def update
    set_author
    if @author.update(author_params)
      redirect_to author_path(@author), notice: "Author Updated"
    end
  end

  def destroy
    set_author
    @author.destroy
    redirect_to authors_path
  end


private


  def author_params
    params.require(:author).permit(:name)
  end

  def set_author
    @author = Author.find(params[:id])
  end
end
