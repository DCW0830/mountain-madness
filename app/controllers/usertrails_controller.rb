class UsertrailsController < ApplicationController
  def destroy
    usertrail = Usertrail.find_by(trail_id: params[:id])
    usertrail.destroy
    flash[:notice] = "You have removed the trail from your personal dashboard."
    redirect_to dashboard_index_path
  end
end
