class CommentDecorator <  Draper::Decorator
  delegate_all
  include Draper::LazyHelpers
  def name
    user.name
  end

  def hour
    created_at.to_fs(:time)
  end

  def user_comment
    comment.comment
  end
end
