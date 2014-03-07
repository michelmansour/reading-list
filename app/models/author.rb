class Author < ActiveRecord::Base
  has_many :books
  validates :last_name, presence: true
end
