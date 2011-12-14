require 'test_helper'

class ReservationsControllerTest < ActionController::TestCase
  
  setup do
    @user = Factory(:user)
    sign_in_as(@user)
    @book             = books(:one)
    @book_reservation = books(:two) 
    @reservation      = Reservation.create(book: @book_reservation, user_id: @user.id)
  end
  
  test "create reservation with valid parameters" do
    assert_difference("Reservation.count", +1) do
      post :create, book_id: @book.id, reservation: {}
      assert_response :redirect
      assert_redirected_to book_path(@book)
      assert flash[:notice]
    end
  end

  test "free reservation with correct user logged in" do
    put :free, book_id: @book_reservation.id, id: @reservation.id
    assert_response :redirect
    assert_redirected_to book_path(@book_reservation)
    assert_equal 'free', assigns(:reservation).state
    assert flash[:notice]
  end
  
  test "free reservation with wrong user logged in" do
    sign_in_as(Factory(:user))
    put :free, book_id: @book_reservation.id, id: @reservation.id
    assert_response :redirect
    assert_redirected_to book_path(@book_reservation)
    assert_equal 'reserved', assigns(:reservation).state
    assert flash[:error]
  end
  
end
