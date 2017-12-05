require "UrlCounter/version"

module UrlCounter
  def self.count(url, date)
    UrlCounter::Url.where(:address => url, :visit_date => date).size
  end


  def self.present_urls()
    render html: '<div>html goes here</div>'.html_safe
  end
end
