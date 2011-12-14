require 'test_helper'

class RatingTest < ActiveSupport::TestCase
  setup do
    @book = books(:one)
    @book.save
    
    @rating = Rating.new(book: @book)
  end
  
  test "rating is 1 or -1" do
    @rating.rating = 0
    assert @rating.invalid?
    @rating.rating = nil
    assert @rating.invalid?
    @rating.rating = 1
    assert @rating.valid?
    @rating.rating = -1
    assert @rating.valid?
    assert @rating.save    
  end
  
  test "plusses" do
    4.times do 
      Rating.create(book: @book, rating: 1)
    end
    assert_equal @book.ratings.plusses, 4
  end
  
  test "minuses" do
    4.times do 
      Rating.create(book: @book, rating: -1)
    end
    assert_equal @book.ratings.minuses, 4    
  end
  
end
