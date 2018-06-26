require 'rest-client'
require 'json'
require 'pry'

def get_character_movies_from_api(character)
  #make the web request
   all_films = []
   all_characters = RestClient.get('http://www.swapi.co/api/people/')
   character_hash = JSON.parse(all_characters)

   char = character_hash["results"].each do |name|
     if name["name"].downcase == character
       all_films << name["films"]
     end
   end
  all_films
  gather_film_info(all_films)
  # iterate over the character hash to find the collection of `films` for the given
  #   `character`
  # collect those film API urls, make a web request to each URL to get the info
  #  for that film
  # return value of this method should be collection of info about each film.
  #  i.e. an array of hashes in which each hash reps a given film
  # this collection will be the argument given to `parse_character_movies`
  #  and that method will do some nice presentation stuff: puts out a list
  #  of movies by title. play around with puts out other info about a given film.
end

def gather_film_info(all_films)
  film_info = []
  all_films.flatten.each do |film_title|
      rested_films = RestClient.get("#{film_title}")
      parsed_films = JSON.parse(rested_films)
      film_info << parsed_films
    end
  film_info
end


def parse_character_movies(films_hash)
  counter = 1
  films_hash.each do |title|
    puts "=== TITLE ==="
    puts "#{counter}: #{title["title"]}"
    puts "=== DIRECTOR ==="
    puts "#{title["director"]}"
    puts "=== RELEASE DATE ==="
    puts "#{title["release_date"]}"
    counter += 1


  end
  # some iteration magic and puts out the movies in a nice list
end


def show_character_movies(character)
 films_hash = get_character_movies_from_api(character)
 parse_character_movies(films_hash)
end

## BONUS

# that `get_character_movies_from_api` method is probably pretty long. Does it do more than one job?
# can you split it up into helper methods?
