module Newil86
  module Fp
    class << self
      # Обратиться к параметрам фильма можно так:
      # film["name"], film["rating_kinopoisk"], film["rating_imdb"],
      # film["genres"], film["year"], film["access_level"], film["country"]
      def rating(array)
        filtered_films = array.select do |film|
          !film['country'].nil? && film['country'].split(',').length >= 2 && !film['rating_kinopoisk'].to_f.zero?
        end

        rating_sum = filtered_films.map { |film| film['rating_kinopoisk'].to_f }.reduce(:+)
        rating_sum / filtered_films.length
      end

      def chars_count(films, threshold)
        letter = 'и'

        selected = films.select do |item|
          item['rating_kinopoisk'] && item['rating_kinopoisk'].to_f >= threshold
        end
        selected.map { |item| item['name'].count(letter) }.reduce(:+)
      end
    end
  end
end
