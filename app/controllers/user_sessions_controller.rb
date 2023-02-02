class UserSessionsController < ApplicationController
  def create
    @user = login(params[:email], params[:password])
    if @user
      flash[:notice] = 'Login successful Juani'
      redirect_to(home_path)
    else
      flash[:alert] = 'Login failed'
      redirect_back_or_to root_path
    end
  end

  def destroy
    logout
    redirect_to(root_path, notice: 'Logged out!')
  end


end
