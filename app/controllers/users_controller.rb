class UsersController < ApplicationController
  before_action :ensure_frame_response, only: %i[new edit]
  before_action :set_user, only: %i[show edit update destroy]

  def login
    return unless current_user

    redirect_to users_list_path
  end

  def edit
    authorize User
  end

  def index; end

  def users_list
    authorize User
    @filter = UserFilter.new(User.all, filter_params)
    @users  = @filter.call.order(:created_at)
    flash.now[:error] = "Couldn't find any user" if @users.empty?
    @pagy, @records = pagy(@users)
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
      @user = User.new(user_create_params)
      if user_create_params['password'] == params['user']['password_confirmation']
        if @user.save
          flash[:notice] = 'Successfully created user.'
          redirect_to users_list_path
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
    authorize User
    @user.update(user_params)
    flash[:notice] = if @user.save
                       'Usuario modificado con exito'
                     else
                       @user.errors
                     end
    redirect_to users_list_path
  end

  def change_active
    authorize User
    @user = User.find(params[:user_id])
    @user.active = params[:user][:active]
    if @user.save
      flash[:notice] = 'Estado modificado'
    else
      flash[:error] = @user.errors.full_messages.to_sentence
    end
    redirect_to users_list_path
  end

  private

  def set_user
    @user = User.find(params[:id])
  end

  def user_create_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation,
                                 :lastname, :rol).except(:password_confirmation)
  end

  def user_params
    params.require(:user).permit(:name, :email, :lastname, :rol)
  end

  def filter_params
    params.fetch(:user_filter, {}).permit(
      :name
    )
  end

  def ensure_frame_response
    return unless Rails.env.development?

    redirect_to users_list_path unless turbo_frame_request?
  end
end
