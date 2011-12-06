class ReservationsController < ApplicationController
  
  def new
    @book = Book.find(params[:book_id])
    @reservation = @book.reservations.new
  end
  
  def create
    @book = Book.find(params[:book_id])
    @reservation = @book.reservations.new(params[:reservation])
    if @reservation.save
      flash[:notice] = "Book reserved"
      redirect_to book_path(@book)
    else
      render :new
    end
  end
  
end
