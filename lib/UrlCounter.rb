require "UrlCounter/version"
require 'csv'

module UrlCounter
  def self.count(url, date)
    url + ', ' + (Url.where('address LIKE ?', url).where(:visit_date => date).size).to_s + ', ' + date
  end


  def self.listUrl(*urls, startDate, endDate)
    theList = Array.new
    urls.each do |url|
      (startDate..endDate).each do |date|
        theList << self.count(url, date)
      end
    end
    theList
  end

  def self.presentHTML(rows)
    htmlCode = ''
    rows.each do |row|
      htmlCode += '<div>' + row + '<div><br>'
    end
    htmlCode

  end

  def self.exportCSV(rows)
    CSV.generate do |csv|
      rows.each do |row|
        csv << row.split(',')
      end
    end
  end

end
