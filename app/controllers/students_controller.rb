class StudentsController < ApplicationController
  def index
    @presenter = StudentsPresenter.new(params)
  end
end
