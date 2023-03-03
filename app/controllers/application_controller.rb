class ApplicationController < ActionController::Base
  include Pagy::Backend
  include Pundit::Authorization
  before_action :require_login
  rescue_from Pundit::NotAuthorizedError, with: :not_authorized
  add_flash_types :success, :warning

  def not_authorized
    if current_user.colaborador?
      redirect_back(fallback_location: students_path)
      flash[:notice] = t('.notice')
    else
      redirect_back(fallback_location: root_path)
    end
  end

  def not_authenticated
    redirect_to login_path
  end
end
