class StudentsPresenter
  include Pagy::Backend
  attr_reader :params,:students

  def initialize(params, students = [])
    @params = params
    @students = students
  end

  def students_all
    Student.all.decorate
  end

  def students
    paginate

    @students.decorate
  end

  def pagy_data
    paginate

    @pagy_data
  end

  def paginate
    return if @pagy_data.present?

    @pagy_data, @students = pagy(Student.all, items: 10)
  end

  def comments
    @comments ||= @students.comments.order(created_at: :desc)
  end
  def grouped_comments(stand_out)
    comments.decorate.where(stand_out: stand_out)
            .group_by{ |c| c.created_at.to_date }
  end
end
