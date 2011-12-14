class RatingsController < ApplicationController
  def create
    @book = Book.find(params[:book_id])
    @rating = @book.ratings.new(params[:rating])
    @rating.save
    respond_to do |format|
      format.html { redirect_to book_path(@book) }
      format.js
    end
  end
end
