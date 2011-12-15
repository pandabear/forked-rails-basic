require 'test_helper'

class RatingsControllerTest < ActionController::TestCase
  setup do
    @user = Factory(:user)
    sign_in_as(@user)
    @book = books(:one)
    @book.save
  end
  
  test "should create" do
    assert_difference("Rating.count", +1) do
      post :create, book_id: @book.id, rating: {rating: 1}
      assert_response :redirect
      assert_redirected_to book_path(@book)      
    end
  end
  
  test "should create with ajax" do
    assert_difference("Rating.count", +1) do
      xhr :post, :create, book_id: @book.id, rating: {rating: 1}
      assert assigns(:book)
      assert_equal response.content_type, Mime::JS
    end
  end
end
