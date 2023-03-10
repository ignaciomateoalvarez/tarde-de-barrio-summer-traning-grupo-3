class PublicationDecorator <  Draper::Decorator
  delegate_all
  include Draper::LazyHelpers
  decorates_association :answers
  def name
    user.name
  end

  def hour
    created_at.to_fs(:time)
  end

end
