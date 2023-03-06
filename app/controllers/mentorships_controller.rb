class MentorshipsController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index, :show]
  before_action :set_mentorship, only: [:show, :destroy, :edit, :update]

  def index
    @mentorships = policy_scope(Mentorship)
    @markers = @mentorships.geocoded.map do |mentorship|
      {
        lat: mentorship.latitude,
        lng: mentorship.longitude,
        info_window_html: render_to_string(partial: "info_window", locals: {mentorship: mentorship})
      }
    end
  end

  def show
    authorize @mentorship
    @mentorship_owner = (@mentorship.user == current_user)
    @booking = @mentorship.bookings.find_by(user_id: current_user.id)


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
      params[:mentorship][:tag_ids].delete_at(0)
      tags_array = params[:mentorship][:tag_ids]
      tags_array.each do |tag|
        @mentorship_tag = MentorshipTag.new
        @mentorship_tag.tag_id = tag.to_i
        @mentorship_tag.mentorship = @mentorship
        @mentorship_tag.save!
      end


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
    params.require(:mentorship).permit(:title, :content, :address, :photo, tags: [])
  end
end
