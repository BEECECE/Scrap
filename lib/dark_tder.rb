require 'rubygems'
require 'nokogiri'
require 'open-uri'

PAGE_URL = "https://coinmarketcap.com/all/views/all/"

page = Nokogiri::HTML(open(PAGE_URL))   

excel = Hash.new
name_crypto = Array.new
price_crypto = Array.new

page.xpath('//*[@class="link-secondary"]').each do |node|
    name_crypto << node.text
end

page.xpath('//*[@class="price"]').each do |node|
    price_crypto << node.text
end

excel = name_crypto.zip(price_crypto)
excel.each do |key, value|     #excel.each : ce qui sera affiché
    puts "#{key} : #{value}"   #le nouveau tableau
end 
