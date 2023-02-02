class UserSessionsController < ApplicationController
  def create
    @user = login(params[:email], params[:password])
    if @user
      flash[:notice] = 'Login successful'
      redirect_to(home_path)
    else
      flash[:alert] = 'Login failed'
      render :log_in, status: :unprocessable_entity
    end
  end

  def destroy
    logout
    redirect_to(root_path, notice: 'Logged out!')
  end
end
