class Book < ApplicationRecord
  has_many :comments
  has_and_belongs_to_many :authors
  belongs_to :category
  has_many :votes

  def average_rating
    votes.average(:rating).to_s
  end

  def self.search(q)
    q = "%#{q.downcase}%"
    where("lower(name) LIKE ? OR lower(description) LIKE ?", q, q)
  end

  has_attached_file :book_image, :styles => { :medium => "300x300>", :thumb => "100x100>" }, :default_url => "/images/:style/missing.png"
  validates_attachment_content_type :book_image, :content_type => /\Aimage\/.*\Z/

end
