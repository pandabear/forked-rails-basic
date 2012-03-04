require 'test_helper'

class RatingTest < ActiveSupport::TestCase
  setup do
    @book = books(:steppenwolf)
    @rating = Rating.new(
      book_id: @book.id,
      email: "h@douken.com",
      rate: 5
    )
  end
  
  test "rating with book id, email and rate is valid" do
    assert @rating.valid?
    assert @rating.save
  end

  test "rating without book id is not valid" do
    @rating.book_id = nil
    assert @rating.invalid?
    assert !@rating.save
  end
  
  test "rating without email is invalid" do
    @rating.email = nil
    assert @rating.invalid?
    assert !@rating.save
  end
  
  test "rating with invalid email is invalid" do
    @rating.email = "a@b.c"
    assert @rating.invalid?
  end
  
  test "rating's rate can only be value of 1 to 10" do
    @rating.rate = 5
    assert @rating.valid?
    assert @rating.save
  end
  
  test "rating's rate can't be outside the range of 1-10" do
    @rating.rate = 0
    assert @rating.invalid?
    assert !@rating.save
  end
  
  test "same user can not rate same book multiple times" do
    copied_rating = @rating.dup
    copied_rating.rate = 10
    assert @rating.save
    assert !copied_rating.save
  end

  test "a book's overall average rating can be seen" do
    copied_rating = @rating.dup
    copied_rating.rate = 10
    copied_rating.email = "v@lid.com"
    overall_rate = (@rating.rate + copied_rating.rate + 0.0) / 2
    assert @rating.save
    assert copied_rating.save
    assert_equal overall_rate, @book.overall_rate
  end
end
