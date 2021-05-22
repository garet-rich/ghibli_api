require 'faraday'
require 'json'
require 'pry'

class Film
    attr_reader :title,
                :description,
                :director,
                :producer,
                :release_date,
                :rotten_tomatoes
    def initialize(data)
        @title = data[:title]
        @description = data[:description]
        @director = data[:director]
        @producer = data[:producer]
        @release_date = data[:release_date]
        @rotten_tomatoes = data[:rt_score]
    end
end

response = Faraday.get("https://ghibliapi.herokuapp.com/films")
parsed = JSON.parse(response.body, symbolize_names: true)

films = parsed.map do |data|
    Film.new(data)
end

films.each do |film|
    puts film.title
    puts "Directed By: #{film.director}"
    puts "Produced By: #{film.producer}"
    puts "Rotten Tomatoes Score: #{film.rotten_tomatoes}"
    puts ""
end