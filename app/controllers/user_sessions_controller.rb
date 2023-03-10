class UserSessionsController < ApplicationController
  skip_before_action :require_login, only: %i[new create]

  def new; end

  def create
    @user = User.find_by(email: params[:email])
    if @user.present?
      if @user.active?
        login(params[:email], params[:password], remember_me = params[:remember_me])
        redirect_back_or_to(root_path, success: "#{t('.welcome')} #{@user.name}")
      else
        redirect_to login_path, warning: t('.user_disabled')
      end
    else
      redirect_to login_path, warning: t('.incorrect_info')
    end
  end

  def destroy
    logout
    redirect_to(login_path, notice: t('.notice'))
  end
end
