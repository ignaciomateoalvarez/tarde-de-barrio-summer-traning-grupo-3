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
