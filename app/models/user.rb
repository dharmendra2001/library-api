class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  # validates_format_of :password, :with => /^[A-Za-z0-9. ! @ # $ % ^ & * ( ) _ - + = ]*\z/
  email_regex = /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\Z/i

  validates :password, presence: true, length: { minimum: 8 }

  has_many :books
  has_many :issuedBooks
  enum :role,[:admin, :student], default: :student
  devise :database_authenticatable,
  :jwt_authenticatable,
  :registerable,
  jwt_revocation_strategy: JwtDenylist

  
end
