class CategoriesController < ApplicationController
  before_action :set_category, except: [:index]

  def index
    @categories = Category.all
  end

  def show
    @category = Category.find(params[:id])
  end

  def top_books
    @books = @category.top_books
  end

  private

  def set_category
    @category = Category.find(params[:id])
  end
end
