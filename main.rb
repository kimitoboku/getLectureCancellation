require 'open-uri'
require 'pp'
require 'nokogiri'
require 'kconv'

URL = "https://www.ead.tut.ac.jp/board/main.aspx"
doc = Nokogiri::HTML.parse(open(URL).read.toutf8)
lectureCancellation = doc.xpath(%Q[//table[@id="grvCancel"]])
lectureCancellation.text.split(/(\s\s\s+)/).each do |i|
  if(i =~ /\(.\)/)then
    puts i.gsub("\t", "").gsub("\r", "").gsub("\n", "")
  end
end

