class BooksController < ApplicationController
  def new
    @book = Book.new
  end

  def index
    @books = Book.all
  end

  def create

  end
end


private

def set_book
  @book = Book.find(params[:id])
end

def book_params
  params.require(:book).permit(:name, :description, :summary, :ISBN)
end