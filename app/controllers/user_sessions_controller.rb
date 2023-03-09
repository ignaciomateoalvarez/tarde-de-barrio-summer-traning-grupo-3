class UserSessionsController < ApplicationController
  skip_before_action :require_login, only: %i[new create]

  def new; end

  def create
    @user = User.find_by(email: params[:email])
    if @user && @user.active
      login(params[:email], params[:password])
      redirect_to users_path, notice: t('.notice')
    else
      flash[:error] = t('.error')
      render :new, status: :unprocessable_entity
    end
  end

  def destroy
    logout
    redirect_to(login_path, notice: t('.notice'))
  end
end
