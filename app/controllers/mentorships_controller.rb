class MentorshipsController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index, :show]
  before_action :set_mentorship, only: [:show, :destroy, :edit, :update]

  def index
    @mentorships = policy_scope(Mentorship)
  end

  def show
    authorize @mentorship
  end

  def new
    @mentorship = Mentorship.new
    authorize @mentorship, :show?
  end

  def create
    @mentorship = Mentorship.new(mentorship_params)
    @mentorship.user = current_user
    authorize @mentorship
    if @mentorship.save
      redirect_to mentorships_path(@mentorship)
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
    authorize @mentorship
  end

  def update
    authorize @mentorship
    @mentorship.update(mentorship_params)
    redirect_to mentorship_path(@mentorship)
  end

  def destroy
    authorize @mentorship
    @mentorship.destroy
    redirect_to mentorships_path, status: :see_other
  end

  private

  def set_mentorship
    @mentorship = Mentorship.find(params[:id])
  end

  def mentorship_params
    params.require(:mentorship).permit(:title, :content, :place, :photo)
  end
end
