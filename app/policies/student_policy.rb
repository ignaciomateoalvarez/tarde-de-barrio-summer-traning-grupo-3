class StudentPolicy
  attr_reader :user, :record

  def initialize(user, record)
    @user = user
    @record = record
  end

  def edit?
    @user.administrador? || (@user.colaborador? && @record.user == @user)
  end

  def update?
    edit?
  end

  def destroy?
    @user.administrador?
  end
end
