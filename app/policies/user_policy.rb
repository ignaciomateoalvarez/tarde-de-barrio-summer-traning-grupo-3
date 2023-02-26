class UserPolicy
  attr_reader :user, :record

  def initialize(user, record)
    @user = user
    @record = record
  end

  def create
    @user.administrador?
  end

  def edit?
    @user.administrador?
  end

  def update?
    @user.administrador?
  end

  def users_list?
    @user && (@user.administrador? || @user.colaborador?)
  end

  def change_active?
    @user.administrador?
  end
end
