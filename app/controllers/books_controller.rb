class BooksController < ApplicationController
  def new
    @book = Book.new
  end

  def show
    set_book
  end

  def index
    @books = Book.all
  end

  def create
    @book = Book.new(book_params)

    if @book.save
      redirect_to book_path(@book), notice: "Book Saved"
    else
      render 'form'
    end
  end

  def edit
    set_book
  end

  def update
    set_book
    if @book.update(book_params)
      redirect_to book_path(@book), notice: "Book Updated"
    else
      render 'form'
    end
  end

  def destroy
    set_book
    @book.destroy
    redirect_to books_path
  end


private

def set_book
  @book = Book.find(params[:id])
end

def book_params
  params.require(:book).permit(:name, :description, :summary, :ISBN, :published_at)
end

end
