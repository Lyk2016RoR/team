class Category < ApplicationRecord
  has_many :books
  def top_books
    books
      .joins(:votes)
      .select("books.*, avg(votes.rating) as point")
      .group("books.id")
      .order("point DESC")
      .limit(10)
  end
end
