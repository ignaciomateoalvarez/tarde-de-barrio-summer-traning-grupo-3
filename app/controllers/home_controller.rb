class HomeController < ApplicationController
  include DateHelper
  def index
    @presenter = StudentsPresenter.new(params)
    @home_presenter = HomesPresenter.new(params,Post.all.order(created_at: :desc))
  end
end
