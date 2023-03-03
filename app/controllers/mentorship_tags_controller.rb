class MentorshipTagsController < ApplicationController
  def new
    @plant_tag = PlantTag.new
  end

  private

  def mentorshiptags_params
    params.require(:mentorshiptags).permit(:tag_id, :mentorship_id)
  end

end
