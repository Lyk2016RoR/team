class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

 has_attached_file :avatar, :styles => { :medium => "300x300>", :thumb => "100x100#" }, :default_url => "/images/:style/missing.png"
 validates_attachment_content_type :avatar, :content_type => /\Aimage\/.*\Z/

  has_many :votes
  has_many :books
  has_many :favorite_books
  has_many :favorites, through: :favorite_books, source: :book

  def lists name
    favorites.where(name: name)
  end

  # @user.lists('readed')

end
