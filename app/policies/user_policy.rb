class UserPolicy
  attr_reader :user, :record

  def initialize(user, record)
    @user = user
    @record = record
  end

  def edit?
    @user.administrador?
  end

  def update?
    @user.administrador?
  end

  def users_list?
    @user.administrador?
  end

  def create_student?
    @user.administrador? || @user.colaborador?
  end

  def create_note_student?
    @user.administrador? || @user.colaborador?
  end

  def edit_student?
    @user.administrador? || student.user == user
  end

  def create_news?
    @user.administrador? || @user.colaborador?
  end

  def list_assists?
    @user.administrador? || @user.colaborador?
  end

  def change_active?
    @user.administrador?
  end

  def calendar?
    @user.administrador?
  end
end
