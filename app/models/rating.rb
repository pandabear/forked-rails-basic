class Rating < ActiveRecord::Base
  belongs_to :book
  belongs_to :user
  
  RATINGS = [1, -1]
  validates :rating, presence: true, inclusion: RATINGS
  validates :user_id, presence: true, uniqueness: {scope: :book_id}
  
  def self.plusses
    where(rating: 1).count
  end
  
  def self.minuses
    where(rating: -1).count
  end
end
