class Book < ApplicationRecord

  has_many :comments
  belongs_to :category
  has_many :votes
  has_and_belongs_to_many :authors


  def average_rating
    rating = votes.average(:rating)
    rating ? rating.to_s : "0.0"
  end

  has_attached_file :book_image, :styles => { :medium => "300x300>", :thumb => "100x100>" }, :default_url => "/images/:style/missing.png"
  validates_attachment_content_type :book_image, :content_type => /\Aimage\/.*\Z/

end
