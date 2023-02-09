class UserSessionsController < ApplicationController
  def create
    @user = User.find_by(email: params[:email])
      if @user && @user.active
        login(params[:email], params[:password])
        redirect_to root_url, notice: 'Logged in'
      else
        flash[:error] = 'Usuario o contraseña incorrectos'
        redirect_to login_path, status: :unprocessable_entity
      end
  end

  def destroy
    logout
    redirect_to(root_path, notice: 'Logged out!')
  end
end