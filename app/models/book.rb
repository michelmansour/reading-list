class Book < ActiveRecord::Base

  attr_accessor :pub_year

  has_many :book_authors
  has_many :authors, through: :book_authors
  has_many :comments, dependent: :destroy
  validates :title, presence: true
  validates :pub_year, length: { is: 4 }, numericality: true
  validates :total_pages, numericality: true

  before_save :convert_pub_year

  def convert_pub_year
    if self.pub_year
      self.publication_date = Date.strptime(self.pub_year, "%Y")
    end
  end
end
