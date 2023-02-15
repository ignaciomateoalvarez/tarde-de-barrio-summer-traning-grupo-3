class StudentDecorator < Draper::Decorator
  delegate_all

  def full_name
    @full_name ||= "#{name} #{lastname}"
  end

  def currently_studying_humanized
    currently_studying ? 'Si' : 'No'
  end

  def school_grade_capitalize
    school_grade.capitalize
  end
end
