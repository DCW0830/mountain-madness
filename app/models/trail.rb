class Trail < ActiveRecord::Base
  include HTTParty
  has_many :usertrails
  has_many :users, through: :usertrails

  def self.search(search)
    #response = HTTParty.get('https://outdoor-data-api.herokuapp.com/api.json?&api_key=9a4912af55dd690f097662cdf5b21bcb&q[city_eq]=Denver')
    response = HTTParty.get(build_url)
  end

  def url
    'https://outdoor-data-api.herokuapp.com/api.json'
  end

  def api_key
    '?&api_key=9a4912af55dd690f097662cdf5b21bcb'
  end

  def city(searched_city)
    "&q[city_eq]=#{searched_city}"
  end

  def build_url(searched_city)
    built = url + api_key + city(searched_city)
    built.to_s
  end
end
