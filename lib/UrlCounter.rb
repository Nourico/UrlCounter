require "UrlCounter/version"

module UrlCounter
  def self.count(url, date)
      UrlCounter::Url.where(:address => url)
  end


end
