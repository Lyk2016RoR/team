class AddBookAuthorIdToComments < ActiveRecord::Migration[5.0]
  def change
    add_reference :comments, :book, foreign_key: true
    add_reference :comments, :author, foreign_key: true
  end
end
