class UserRegistrationsController < ApplicationController
  skip_before_action :require_login, only: %i[new create]

  def new
    @user = User.new
  end

  def create
    @user = User.new(register_params)
    if @user.save
      auto_login(@user)
      redirect_to users_path, notice: t('.notice')
    else
      redirect_to register_path
    end
  end

  private

  def register_params
    params.require(:user).permit(:name, :lastname, :email, :password, :password_confirmation)
  end
end
