require 'test_helper'

class RatingTest < ActiveSupport::TestCase
  setup do
    @user = Factory(:user)
    @book = books(:one)
    @book.save
    
    @rating = Rating.new(book: @book, user_id: @user.id)
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
      Rating.create(book: @book, rating: 1, user_id: @user.id)
    end
    assert_equal @book.ratings.plusses, 1
  end
  
  test "minuses" do
    4.times do 
      Rating.create(book: @book, rating: -1, user_id: @user.id)
    end
    assert_equal @book.ratings.minuses, 1   
  end
  
end
