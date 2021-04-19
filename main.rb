require 'open-uri'
require 'uri'
require 'net/http'
require 'nokogiri'
require 'multi_xml'


puts 'Please Input RSS url: '
url = gets.chomp
		 
# convert @url variable to a URI
uri = URI(url)

# initialize response with the uri
response = Net::HTTP.get(uri)

# parse the XML using Nokogiri
doc = MultiXml.parse(response) 

title = doc['rss']['channel']['title']
description = doc['rss']['channel']['description']

puts 'Title: ' + title
puts 'Description: ' + description
puts 'Link: ' + url
