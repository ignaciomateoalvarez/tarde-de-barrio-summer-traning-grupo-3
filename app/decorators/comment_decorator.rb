class CommentDecorator <  Draper::Decorator
  delegate_all
  include Draper::LazyHelpers
  decorates_association :subcomments
  def name
    user.name
  end

  def hour
    created_at.to_fs(:time)
  end

end
