class AddFieldsToBooks < ActiveRecord::Migration
  def change
    add_column :books, :publication_date, :date,
    add_column :books, :isbn, :string,
    add_column :books, :language, :string,
    add_column :books, :summary, :text,
    add_column :books, :title_orig, :string,
    add_column :books, :read_status, :integer,
    add_column :books, :total_pages, :integer,
    add_column :books, :pages_read, :integer,
    add_column :books, :rating, :integer,
    add_column :books, :completed, :date
  end
end
