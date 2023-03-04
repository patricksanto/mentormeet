class MentorshipTagsController < ApplicationController
  def new
    @mentorshiptag = MentorshipTag.new
  end


  private

  def mentorshiptags_params
    params.require(:mentorshiptags).permit(:tag_id, :mentorship_id)
  end

end
