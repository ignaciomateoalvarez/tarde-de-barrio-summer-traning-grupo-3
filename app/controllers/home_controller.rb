class HomeController < ApplicationController
  def index
    unless current_user
      #reset_session
      flash[:error] = "You must be logged in"
      render json: {status: "You are not logged in", user: current_user, session: session}
      #render sessionhandling_welcome_path
    end
  end
end
