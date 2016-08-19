class CreateBooksLists < ActiveRecord::Migration[5.0]
  def change
    create_join_table :books, :lists
    end
  end

