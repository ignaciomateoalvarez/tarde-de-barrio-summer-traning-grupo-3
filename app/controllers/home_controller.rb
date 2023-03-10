class HomeController < ApplicationController
  def index
    @publications = Post.all.order(created_at: :desc)
    @stand_out_publication = @publications.decorate.where(stand_out: true)
    .group_by{ |c| c.created_at.to_date  == Date.today }
    @not_stand_out_publication = @publications.decorate.where(stand_out: false)
    .group_by{ |c| c.created_at.to_date == Date.today }

    @date = I18n.l(Date.today, format: "%B %Y")
    @day =I18n.l(Date.today, format: "%A %d")

    @presenter = StudentsPresenter.new(params)
  end
end
