class BookingsController < ApplicationController
  before_action :set_booking, only: [:show, :edit, :update, :destroy]
  before_action :set_mentorship, only: %i[new create]
  #INCOMPLETE CONTROLLER

  def index
    @bookings = Booking.all
  end

  def show
  end

  def new
    @booking = Booking.new
    authorize @booking
  end

  def create
    @booking = Booking.new(booking_params)
    @booking.user = current_user
    @booking.mentorship = @mentorship
    authorize @booking
    if @booking.save
      redirect_to mentorships_path
    else
      render :new
    end
  end

  def edit
    authorize @booking
  end





  def update
    if @booking.update(booking_params)

      redirect_to mentorships_path
    else
      render :edit
    end
  end

  def destroy
    authorize @booking
    @booking.destroy
  end

  private

  def set_booking
    @booking = Booking.find(params[:id])
  end

  def set_mentorship
    @mentorship = Mentorship.find(params[:mentorship_id])
  end

  def booking_params
    params.require(:booking).permit(:mentorship_id, :user_id, :date, :is_accepted)
  end
end
