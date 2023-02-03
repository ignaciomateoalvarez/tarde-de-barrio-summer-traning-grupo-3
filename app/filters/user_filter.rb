class UserFilter 
  include ActiveModel::API
  include ActiveModel::Attributes

  attribute :name, :string
  attribute :lastname, :string

  attr_reader :users

  def initialize(scope, params)
    super(params)

    @users = scope
  end

  def call
    by_name!
    by_lastname!

    users
  end

  def by_name!
    return if name.blank?
    @users = @users.where('lower(name) like ?', "%#{name.downcase}%") if name.present?
  end

  def by_lastname!
    return if lastname.blank?

    @users = @users.where('lower(lastname) like ?', "%#{lastname.downcase}%") if lastname.present?
  end
end
