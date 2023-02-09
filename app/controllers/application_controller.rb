class ApplicationController < ActionController::Base
  include Pagy::Backend
  I18n.default_locale = :es
  include Pundit::Authorization
  rescue_from Pundit::NotAuthorizedError, with: :not_authorized
  def not_authorized
    flash[:error] = 'No tenes permisos'
    redirect_to root_path
  end
end
