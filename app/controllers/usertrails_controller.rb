class UsertrailsController < ApplicationController

  def destroy
    usertrail = current_user.trails.find(params[:id])
    usertrail.destroy
    flash[:notice] = "You have removed the trail from your personal dashboard."
    redirect_to dashboard_index_path
  end
end
