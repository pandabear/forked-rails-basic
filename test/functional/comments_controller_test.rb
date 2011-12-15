require 'test_helper'

class CommentsControllerTest < ActionController::TestCase
  setup do
    @user = Factory(:user)
    sign_in_as(@user)
    @book = books(:one)
  end
  
  test "should create comment" do
    assert_difference('Comment.count') do
      post :create, book_id: @book.id, 
            comment: {name: 'Test', content: 'Test'}, format: 'js'
    end
    assert_response :success
  end

end
