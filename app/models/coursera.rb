class Coursera
  include HTTParty

  default_options.update(verify: false) # Turn off SSL verification
  base_uri 'https://api.coursera.org/api/catalog.v1/courses'
  default_params fields: "smallIcon,shortDescription", q: "search"
  format :json

  def self.for term
    get("", query: { query: term})["elements"]
  end
end
