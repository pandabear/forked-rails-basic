class Rating < ActiveRecord::Base
  belongs_to :book
  
  RATINGS = [1, -1]
  validates :rating, presence: true, inclusion: RATINGS
  
  def self.plusses
    where(rating: 1).count
  end
  
  def self.minuses
    where(rating: -1).count
  end
end
