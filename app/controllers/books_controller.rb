class BooksController < ApplicationController
  before_action :authenticate_user!, except: [:show, :index]


  def new
    @book = Book.new
    load_categories
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
      load_categories
      render 'books/new'
    end
  end

  def edit
    set_book
    load_categories
  end

  def update
    set_book
    if @book.update(book_params)
      redirect_to book_path(@book), notice: "Book Updated"
    else
      load_categories
      render 'books/edit'
    end
  end

  def destroy
    set_book
    @book.destroy
    redirect_to books_path
  end
  def favorite
    set_book
    type = params[:type]
    if type == "favorite"
        fav = current_user.favorites.build book: @book, name: 'favorites'
        fav = current_user.favorites.build book: @book, name: 'readed'
        fav = current_user.favorites.build book: @book, name: 'wanted'
        fav.save
      redirect_to :back, notice: 'You favorited #{@book.name}'
    elsif type == "unfavorite"
      current_user.favorites.delete(@book)
      redirect_to :back, notice: 'Unfavorited #{@book.name}'
    else
      # Type missing, nothing happens
      redirect_to :back, notice: 'Nothing happened.'
    end
  end

private
  def load_categories
    @categories = Category.all.collect {|c| [c.name, c.id ] }
    end
def set_book
  @book = Book.find(params[:id])
end

def book_params
  params.require(:book).permit(:name, :description, :summary, :ISBN, :published_at, :category_id, :book_image)
end

end
