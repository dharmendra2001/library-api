class Book < ApplicationRecord
    belongs_to :users
    has_many :issuedBooks
    
end
