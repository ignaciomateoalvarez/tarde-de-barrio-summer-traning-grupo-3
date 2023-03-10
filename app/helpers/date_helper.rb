module DateHelper

  def date
    I18n.l(Date.today, format: "%B %Y")
  end

  def day 
    I18n.l(Date.today, format: "%A %d")
  end
end