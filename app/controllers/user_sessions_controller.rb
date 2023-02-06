class UserSessionsController < ApplicationController
  def create
    @user = login(params[:email], params[:password])
    if @user
      flash[:notice] = 'Login successful'
      redirect_to(home_path)
    else
      flash[:error] = 'Login failed'
      redirect_to login_path, status: :unprocessable_entity
    end
  end

  def destroy
    logout
    redirect_to(root_path, notice: 'Logged out!')
  end
end
