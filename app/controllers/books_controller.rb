class BooksController < ApplicationController
  before_action :authenticate_admin!, except: [:show, :index]


  def new
    @book = Book.new
    load_categories
  end

  def show
    set_book
    if current_user
      if @book.votes.where(user_id: current_user.id).any?
        @vote = @book.votes.where(user_id: current_user.id).first
      else
        @vote = @book.votes.build
      end
    end
  end


  def search
    if params[:search].present?
      @books = Book.search(params[:search])
    else
      @books = []
    end
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



private

  def load_categories
    @categories = Category.all.collect {|c| [c.name, c.id ] }
    @authors = Author.all
  end

  def set_book
    @book = Book.find(params[:id])
  end

  def book_params
    params.require(:book).permit(:name, :description, :summary, :ISBN, :published_at, :category_id, :book_image, :translator, :publisher, author_ids: [])
  end

end
