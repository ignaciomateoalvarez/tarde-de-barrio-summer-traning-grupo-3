class HomeController < ApplicationController
  def index
    unless current_user
      flash[:error] = "You must be logged in"
    end
  end
end
