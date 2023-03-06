class ReviewsController < ApplicationController
  before_action :set_review, only: %i[new destroy create]

  def new
    @review = Review.new
    @mentorship = @booking.mentorship
    # authorize @review
    authorize @mentorship
  end

  def create
    @booking = Booking.find(params[:booking_id])
    @mentorship = Mentorship.find(params[:mentorship_id])
    @review = Review.new(review_params)
    @review.mentorship = @mentorship
    @review.booking = @booking
    authorize @review
    if @review.save!
      redirect_to mentorship_path(@review.mentorship)
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
    @booking = Booking.find(params[:booking_id])
  end

  def review_params
    params.require(:review).permit(:title, :rating, :content)
  end
end
