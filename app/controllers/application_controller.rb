class ApplicationController < ActionController::Base
  include Pagy::Backend
  I18n.default_locale = :es
  include Pundit::Authorization
  before_action :require_login
  rescue_from Pundit::NotAuthorizedError, with: :not_authorized
  def not_authorized
    flash[:error] = 'No tenes permisos'
    redirect_to login_path
  end

  def not_authenticated
    redirect_to login_path
  end
end
