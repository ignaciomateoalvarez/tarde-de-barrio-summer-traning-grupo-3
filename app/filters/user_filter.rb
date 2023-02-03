class UserFilter 
  include ActiveModel::API
  include ActiveModel::Attributes

  attribute :name, :string
  attr_reader :users

  def initialize(scope, params)
    super(params)

    @users = scope
  end

  def call
    by_name!

    users
  end

  def by_name!
    return if name.blank?
    @users = @users.where("CONCAT(name, ' ',lastname) || CONCAT (lastname, ' ', name) || name || lastname ILIKE ?", "%#{name.downcase}%") if name.present?
  end
end
