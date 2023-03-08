class HomeController < ApplicationController
  def index
    @presenter = StudentsPresenter.new(params)
  end
end
