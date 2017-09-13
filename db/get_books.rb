require 'pry'
require 'rest-client'
require 'JSON'

character_data1 = RestClient.get('http://isbndb.com/api/v2/json/Y0NTA2TH/books?q=david&i=author_name')

character_hash1 = JSON.parse(character_data1)

binding.pry

puts "hi"
