class AddFieldsToBooks < ActiveRecord::Migration[5.0]
  def change
    add_column :books, :author, :string
    add_column :books, :translator, :string
    add_column :books, :publisher, :string
  end
end
