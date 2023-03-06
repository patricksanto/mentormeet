class ReviewsController < ApplicationController
  before_action :set_review, only: %i[new destroy create]

  def new
    @booking = Booking.find(params[:id])
    @review = Review.new
  end

  def create
    @mentorship = Mentorship.find(params)
    @review = Review.new(review_params)
    if @review.save
      redirect to @review
    else
      render :new, status: :unprocessable_entity
    end
  end

  def destroy
    @review.destroy
    redirect_to mentorship_path(@review.mentorship), status: :see_other
  end

  private

  def set_review
    @booking = Booking.find(params[:id])
  end

  def review_params
    params.require(:review).permit(:title, :rating, :content)
  end
end
