class RatingsController < ApplicationController

  before_filter :find_book

  def rate
    rating = @book.ratings.new(params[:rating])
    existing_rating = @book.ratings.where(email: rating.email).first
    #If existing rating is found, update it instead. 
    if existing_rating
      existing_rating.rate = rating.rate
      rating = existing_rating
    end
    if rating.save
      if existing_rating
        flash[:notice] = "Your rating has been updated."
      else
        flash[:notice] = "Your rating has been saved."
      end
    else
      flash[:error] = "Your rating was not saved due to invalid data."
    end
    respond_to do |format|
      format.html { render "books/show" }
      format.js { render "star_rate"}      
    end
  end

  private

  def find_book
    @book = Book.find(params[:id])
    @book_reservation = @book.reservation
  end
end
