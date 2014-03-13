class Book < ActiveRecord::Base

  attr_accessor :pub_year
  attr_accessor :isbn_num

  has_many :book_authors
  has_many :authors, through: :book_authors
  has_many :comments, dependent: :destroy
  validates :title, presence: true
  validates :pub_year, length: { is: 4 }, numericality: true, allow_blank: true
  validates :isbn_num, length: { minimum: 10, maximum: 13 }, allow_blank: true
  validates :total_pages, numericality: true, allow_blank: true

  before_validation :trim_isbn

  def trim_isbn
    if self.isbn
      self.isbn_num = self.isbn.gsub(/\D/, '')
    end
  end

  before_save :convert_pub_year

  def convert_pub_year
    if not self.pub_year.blank?
      self.publication_date = Date.strptime(self.pub_year, "%Y")
    end
  end
end
