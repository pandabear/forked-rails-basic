class Book < ActiveRecord::Base
  
  validates :title, presence: true, uniqueness: true
  validates :authors, presence: true
  
  validates_with IsbnValidator
  
  has_many :reservations
  has_many :ratings
  
  def reservation
    self.reservations.where(state: 'reserved').first
  end
  
  def self.search_by_isbn(value)
    self.where(isbn: value)
  end

  def self.search_by_authors(value)
    self.where("authors LIKE ?", "%#{value}%").order(
               "authors asc, created_at desc")
  end

  def self.search_by_title(value)
    self.where("title LIKE ?", "%#{value}%").order(
         "title asc, created_at desc")
  end

  def overall_rate
    ratings = Rating.where(book_id: self.id)
    total_rate = 0.0

    if ratings.size > 0
      ratings.each do |rating|
        total_rate += rating.rate
      end
      total_rate = total_rate / ratings.count
    end

    total_rate
  end
end
