class UsersController < ApplicationController
  def log_in; end

  def users_list
    @filter = UserFilter.new(User.all, filter_params)
    @users  = @filter.call

    flash.now[:error] = "Couldn't find any user" if @users.empty?
    @pagy, @records = pagy(@users)
  end

  def new
    if current_user
      redirect_to home_path
    else
      @user = User.new
    end
  end

  def create
    if user_params['password'] == params['user']['password_confirmation']
      @user = User.new(user_params)
      if @user.save
        flash[:notice] = 'Successfully created user.'
        redirect_to login_path
      else
        flash[:error] = @user.errors.full_messages.to_sentence
        redirect_to new_user_path
      end
    else
      flash[:error] = "Passwords don't match."
      redirect_to new_user_path
    end
  end

  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation,
                                 :lastname).except(:password_confirmation)
  end

  def filter_params
    params.fetch(:user_filter, {}).permit(
      :name
    )
  end
end
