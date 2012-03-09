require 'test_helper'

class RatingsControllerTest < ActionController::TestCase

  setup do
    @book = books(:steppenwolf)
    @user_rate = 8
    @user_email = "v@lid.com"
  end

  test "user submits their own rate to their desired book" do
    ratings_count = @book.ratings.count
    post :rate, id: @book.id, rating: { email: @user_email, rate: @user_rate }
    assert_response :success
    assert_template "books/show"
    assert assigns(:book)
    assert_equal (ratings_count + 1), assigns(:book).ratings.count
    assert_equal @user_rate, assigns(:book).overall_rate
    assert flash[:rate_notice]
  end

  test "same user submitting new rate to same book will store only their latest rate" do
    @book.ratings.create(email: @user_email, rate: 2)
    ratings_count = @book.ratings.count
    post :rate, id: @book.id, rating: { email: @user_email, rate: @user_rate }
    assert_response :success
    assert_template "books/show"
    assert assigns(:book)
    assert_equal ratings_count, assigns(:book).ratings.count
    assert_equal @user_rate, assigns(:book).overall_rate
    assert flash[:rate_notice]
  end
  
  test "user not submitting any rate will not be stored" do
    ratings_count = @book.ratings.count
    post :rate, id: @book.id, rating: { email: @user_email }
    assert_response :success
    assert_template "books/show"
    assert assigns(:book)
    assert_equal ratings_count, assigns(:book).ratings.count
    assert flash[:rate_notice_error]
  end
  
  test "user submitting invalid email will not have their rating stored" do
    ratings_count = @book.ratings.count
    post :rate, id: @book.id, rating: { email: "invalid", rate: @user_rate }
    assert_response :success
    assert_template "books/show"
    assert assigns(:book)
    assert_equal ratings_count, assigns(:book).ratings.count
    assert flash[:rate_notice_error]
  end
end
