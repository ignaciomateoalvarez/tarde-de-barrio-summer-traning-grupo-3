class UsersController < ApplicationController
  
  def login
    if current_user
      redirect_to root_path
    end
  end

  def users_list
    if current_user
      @filter = UserFilter.new(User.all, filter_params)
      @users  = @filter.call

      flash.now[:error] = "Couldn't find any user" if @users.empty?
      @pagy, @records = pagy(@users)
    else
      redirect_to login_path
    end
  end

  def new
    if current_user
      redirect_to root_path
    else
      @user = User.new
    end
  end

  def create
    unless current_user
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
    else
      redirect_to login_path
    end
  end

  private

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
