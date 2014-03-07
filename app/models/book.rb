class Book < ActiveRecord::Base
  has_many :book_authors
  has_many :authors, through: :book_authors
  has_many :comments, dependent: :destroy
  validates :title, presence: true, length: { minimum: 5 }
end
