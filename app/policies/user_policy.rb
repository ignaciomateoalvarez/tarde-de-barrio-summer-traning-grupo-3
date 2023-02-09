class UserPolicy
  attr_reader :user, :record

  def initialize(user, record)
    @user = user
    @record = record
  end

  def edit?
    @user.administrador?
  end

  def users_list?
    @user.administrador?
  end

  # def update
  #   @user = User.find(params[:id])
  #   authorize @user
  #   if @user.update(user_params)
  #     redirect_to @user
  #   else
  #     render :edit
  #   end
  # end

  # def publish
  #   @user = User.find(params[:id])
  #   authorize @post, :update?
  #   @post.publish!
  #   redirect_to @post
  # end

  # def destroy?
  #   user.rol == 'admin'
  # end
  # def create_student?
  #   user.rol == 'colaborador' || user.rol == 'admin'

  # end
  # def create_note_student?
  #   user.rol == 'colaborador' || user.rol == 'admin'

  # end
  # def edit_student?
  #   user.rol == 'admin' || student.user == user
  # end
end
