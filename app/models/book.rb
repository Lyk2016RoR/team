class Book < ApplicationRecord

  has_many :comments
  has_and_belongs_to_many :authors
  belongs_to :category
  has_many :votes
  belongs_to :user

  has_many :favorite_books
  has_many :favorited_by, through: :favorite_books, source: :user

  def average_rating
    votes.average(:rating).to_s
  end

  has_attached_file :book_image, :styles => { :medium => "300x300>", :thumb => "100x100>" }, :default_url => "/images/:style/missing.png"
  validates_attachment_content_type :book_image, :content_type => /\Aimage\/.*\Z/

end
