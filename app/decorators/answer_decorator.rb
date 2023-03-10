class AnswerDecorator <  Draper::Decorator
  delegate_all
  include Draper::LazyHelpers
  def name
    user.name
  end

  def hour 
    created_at.to_fs(:time)
  end
  
end
