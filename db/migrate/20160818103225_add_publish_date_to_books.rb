class AddPublishDateToBooks < ActiveRecord::Migration[5.0]
  def change
    add_column :books, :published_at, :date
  end
end
