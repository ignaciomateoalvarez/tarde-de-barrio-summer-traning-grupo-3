class UsersController < ApplicationController
  def login
    return unless current_user

    redirect_to root_path
  end

  def edit
    @user = User.find(params[:id])
  end

  def users_list
    if current_user
      @filter = UserFilter.new(User.all, filter_params)
      @users  = @filter.call
      unless @user
        @user = User.new
      end 
      flash.now[:error] = "Couldn't find any user" if @users.empty?
      @pagy, @records = pagy(@users)
    else
      redirect_to login_path
    end
  end

  def new
    if current_user
      @user = User.new
    else
      redirect_to login_path
    end
  end

  def create
    if current_user
      @user = User.new(user_params)
      if user_params['password'] == params['user']['password_confirmation']
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

  def update
    @user = User.find(params[:id])
    @user.update(user_params)
    flash[:notice]="Usuario modificado con exito"
    redirect_to users_list_path
  end

  private

  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation,
                                 :lastname, :rol).except(:password_confirmation)
  end

  def filter_params
    params.fetch(:user_filter, {}).permit(
      :name
    )
  end
end
