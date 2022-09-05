class CreateIssuedBooks < ActiveRecord::Migration[7.0]
  def change
    create_table :issued_books do |t|
      t.belongs_to :user
      t.belongs_to :book
      t.timestamps
    end
  end
end
