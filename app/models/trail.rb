class Trail < ActiveRecord::Base
  include HTTParty
  require 'open-uri'
  require 'ostruct'
  has_many :usertrails
  has_many :users, through: :usertrails

  def self.search(searched)
    #response = HTTParty.get('https://outdoor-data-api.herokuapp.com/api.json?&api_key=9a4912af55dd690f097662cdf5b21bcb&q[city_eq]=Denver')
    response = HTTParty.get(build_url(searched))

    trails = response.parsed_response["places"].each do |trail|
      OpenStruct.new(trail)
    end
    binding.pry
    trails
  end

  def self.url
    'https://outdoor-data-api.herokuapp.com/api.json'
  end

  def self.api_key
    '?&api_key=9a4912af55dd690f097662cdf5b21bcb'
  end

  def self.city(searched_city)
    searched = URI::encode searched_city
    "&q[city_cont]=#{searched}"
  end

  def self.build_url(searched_city)
    built = url + api_key + city(searched_city)
    built.to_s
  end
end
