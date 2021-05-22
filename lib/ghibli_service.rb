class GhibliService
    def films
        get_url("https://ghibliapi.herokuapp.com/films")
    end

    def get_url
        response = Faraday.get(url)
        JSON.parse(response.body, symbolize_names: true)
    end
end