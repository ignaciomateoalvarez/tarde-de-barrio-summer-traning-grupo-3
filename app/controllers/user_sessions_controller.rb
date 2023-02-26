class UserSessionsController < ApplicationController
  skip_before_action :require_login, only: %i[new create]

  def new; end

  def create
    @user = User.find_by(email: params[:email])
    if @user && @user.active
      login(params[:email], params[:password])
      redirect_to users_list_path, notice: 'Logged in'
    else
      flash[:error] = 'Usuario o contraseña incorrectos'
      render :new, status: :unprocessable_entity
    end
  end

  def destroy
    logout
    redirect_to(login_path, notice: 'Logged out!')
  end
end
