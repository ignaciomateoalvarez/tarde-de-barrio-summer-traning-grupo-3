class UsersController < ApplicationController
  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation,
                                 :lastname).except(:password_confirmation)
  end

  def index; end

  def new
    @user = User.new
  end

  def create
    if user_params['password'] == params['user']['password_confirmation']
      @user = User.new(user_params)
      if @user.save
        flash[:notice] = 'Successfully created user.'
      else
        flash[:error] = 'Error creating user.'
      end
    else
      flash[:error] = "Passwords don't match."
    end
    @user
  end

  def log_in; end
end
