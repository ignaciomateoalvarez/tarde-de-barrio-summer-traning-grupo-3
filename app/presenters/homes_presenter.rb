class HomesPresenter
  attr_reader :params, :publications

  def initialize(params, publications = [])
    @params = params
    @publications = publications
  end

  def grouped_publications(stand_out)
    @stand_out_publication = @publications.decorate.where(stand_out: stand_out)
      .group_by{ |c| c.created_at.to_date  == Date.today }
  end


end