class MentorshipsController < ApplicationController
  before_action :set_mentorship, only: [:show, :destroy, :edit, :update]

  def index
    @mentorships = Mentorship.all
  end

  def show
  end

  def new
    @mentorship = Mentorship.new
  end

  def create
    @mentorship = Mentorship.new(mentorship_params)
    if @mentorship.save
      redirect to @mentorship
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
  end

  def update
    @mentorship.update(mentorship_params)
    redirect_to mentorship_path(@mentorship)
  end

  def destroy
    @mentorship.destroy
    redirect_to mentorships_path, status: :see_other
  end

  private

  def set_mentorship
    @mentorship = Mentorship.find(params[:id])
  end

  def mentorship_params
    params.require(:mentorship).permit(:name, :photo)
  end
end
