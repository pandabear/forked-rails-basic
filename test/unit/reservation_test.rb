require 'test_helper'

class ReservationTest < ActiveSupport::TestCase
  
  setup do
    @user = Factory(:user)
    @new_reservation = Reservation.new(
      book_id: books(:one).id, 
      user_id: @user.id,
      state: 'free'
    )
  end
  
  test "should save valid reservation" do
    assert @new_reservation.valid?
    assert @new_reservation.save
  end
  
  test "should not save reservation without a book_id" do
    @new_reservation.book_id = nil
    assert @new_reservation.invalid?
    assert @new_reservation.errors[:book_id].any?
    assert !@new_reservation.save
  end
  
  test "should not save reservation with invalid state" do
    @new_reservation.save
    @new_reservation.state = 'invalid'
    assert !@new_reservation.save
    assert @new_reservation.errors[:state].any?
  end

  test "should not save without user" do
    @new_reservation.user_id = nil
    assert !@new_reservation.save
    assert @new_reservation.errors[:user_id].any?
  end
  
  test "should not allow reservation if the book already reserved" do
    reservation = reservations(:reserved)
    copy = Reservation.new(reservation.attributes)
    assert !copy.save
    assert_match /book has been already reserved/, copy.errors[:book_id].join
  end
  
  test "should be initially reserved" do
    assert @new_reservation.save
    assert_equal 'reserved', @new_reservation.state
  end

  
end
