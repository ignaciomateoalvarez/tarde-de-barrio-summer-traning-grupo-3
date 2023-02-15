class StudentsPresenter
  include Pagy::Backend
  attr_reader :params

  def initialize(params)
    @params = params
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
end
