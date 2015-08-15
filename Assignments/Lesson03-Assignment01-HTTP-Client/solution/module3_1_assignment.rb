require 'httparty'

class Recipe
  include HTTParty

  base_uri "http://www.recipepuppy.com/api"
  default_params onlyImages: 1
  format :json

  def self.for (keyword)
    get("", query: {q: keyword})["results"]
  end
end
