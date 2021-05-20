require 'faraday'
require 'json'
require 'pry'

response = Faraday.get("https://ghibliapi.herokuapp.com/films")
parsed = JSON.parse(response.body, symbolize_names: true)

binding.pry