class ReviewsController < ApplicationController
  def create
    @book = Book.find(params[:book_id])
    @review = Review.new(review_params)
    @review.book = @book


    if @review.save
      respond_to do |format|
        format.html { redirect_to book_path(@book) }
        format.js
      end
    else
      respond_to do |format|
        format.html { render "books/show" }
        format.js
      end
    end

  end

  private

  def review_params
    params.require(:review).permit(:rating, :content)
  end
end
