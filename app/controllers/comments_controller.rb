class CommentsController < ApplicationController

  def new
    @book = Book.find(params[:book_id])
    @comment = @book.comments.new

    respond_to do |format|
      format.html
    end
  end

  def create
    @book = Book.find(params[:book_id])
    @comment = @book.comments.build(params[:comment])

    respond_to do |format|
      if @comment.save
        format.html { redirect_to book_path(@book), notice: 'Comment was successfully created.' }
      else
        format.html { render action: "new" }
      end
    end
  end

end
