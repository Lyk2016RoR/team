class Comment < ApplicationRecord
  belongs_to :book, optional: true
  belongs_to :author, optional: true

  validate :author_or_book?
  validate :author_or_book

  private

  def author_or_book?
    if author_id.nil? and book_id.nil?
      errors.add(:author_id, "Bir yere bağlanmalı")
      errors.add(:book_id, "Bir yere bağlanmalı")
    end

  end
  def author_or_book
    if author_id and book_id
      errors.add(:author_id, "Bir yere bağlanmalı")
      errors.add(:book_id, "Bir yere bağlanmalı")
    end

  end
end
