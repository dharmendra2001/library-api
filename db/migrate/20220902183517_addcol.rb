class Addcol < ActiveRecord::Migration[7.0]
  def change
    add_column :issued_books,:issue_date, :string
    add_column :issued_books,:return_date, :string
    add_column :books , :description, :string
    #Ex:- add_column("admin_users", "username", :string, :limit =>25, :after => "email")
  end
end
