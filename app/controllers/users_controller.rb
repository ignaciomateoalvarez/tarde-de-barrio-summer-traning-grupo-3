class UsersController < ApplicationController
  before_action :ensure_frame_response, only: %i[new edit]
  before_action :set_user, only: %i[show edit update destroy]
  # after_action  :verify_authorized, only: [:index, :new, :edit]

  def login
    return unless current_user

    redirect_to users_list_path
  end

  def edit
    authorize @user
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
      @user = User.new(user_params)
      if user_params['password'] == params['user']['password_confirmation']
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
    @user = User.find(params[:id])
    @user.update(user_params)
    flash[:notice] = 'Usuario modificado con exito'
    redirect_to users_list_path
  end

  def change_active
    @user = User.find(params[:user_id])
    @user.active = params[:user][:active]
    authorize @user
    if @user.save
      flash[:notice] = 'Estado modificado'
    else
      flash[:error] = @user.errors.full_messages.to_sentence
    end
    redirect_to users_list_path
  end

  #def create_student?; end
  #def create_note_student?; end
  #def edit_student?; end
  #def create_news?; end
  #def list_assists?; end
  #def calendar?; end



  private

  def set_user
    @user = User.find(params[:id])
  end

  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation,
                                 :lastname, :rol).except(:password_confirmation)
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
