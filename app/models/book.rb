class Book < ApplicationRecord
  has_many :comments
  has_and_belongs_to_many :authors
  belongs_to :category
  has_many :votes

  def average_rating
    votes.average(:rating).to_s
  end

end
