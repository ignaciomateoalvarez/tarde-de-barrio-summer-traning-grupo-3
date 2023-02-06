class UserSessionsController < ApplicationController
  def create
    @user = login(params[:email], params[:password], params[:remember])
    if @user
      redirect_to(root_path)
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
