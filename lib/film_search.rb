class FilmSearch
    def films
        service.films.map do |data|
            Film.new(data)
        end
    end

    def service
        GhibliService.new
    end
end