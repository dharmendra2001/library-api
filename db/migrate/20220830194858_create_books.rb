class CreateBooks < ActiveRecord::Migration[7.0]
  def change
    create_table :books do |t|
      t.string :name
      t.string :author_name
      t.string :edition
      t.integer :quantity
      t.integer :issued
      t.belongs_to :user
      t.timestamps
    end
  end
end




