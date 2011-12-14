class CommentsController < ApplicationController

  def new
    @book    = Book.find(params[:book_id])
    @comment = @book.comments.new

    respond_to do |format|
      format.html
    end
  end

  def create
    @book    = Book.find(params[:book_id])
    @comment = @book.comments.build(params[:comment])

    if @comment.save
      flash[:notice] = "Comment saved"
    else
      flash[:error]  = "Comment couldn't be saved"
    end

    respond_to do |format|
      format.js
    end
  end
end