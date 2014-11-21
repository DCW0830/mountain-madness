class Trail < ActiveRecord::Base
  include HTTParty
  require 'open-uri'
  require_dependency 'ostruct'
  has_many :usertrails
  has_many :users, through: :usertrails

  def self.search(state='', city='')
    @response = HTTParty.get(build_url(state, city))
    create_objects
  end

  def self.create_objects
    @response.parsed_response["places"].map do |trail_data|
      OpenStruct.new(trail_data)
    end.select do |trail|
      activity = trail.activities.first || {}
      activity['activity_type_id'] == 5
    end
  end

  def self.url
    'https://outdoor-data-api.herokuapp.com/api.json'
  end

  def self.api_key
    '?&api_key=9a4912af55dd690f097662cdf5b21bcb'
  end

  def self.state(searched_state)
    searched = URI::encode searched_state
    "&q[state_cont]=#{searched}"
  end

  def self.city(searched_city)
    searched = URI::encode searched_city
    "&q[city_cont]=#{searched}"
  end

  def self.build_url(searched_state='', searched_city='')
    built = url + api_key + city(searched_city) +state(searched_state)
    built.to_s
  end

  def bike_trail?
    trail.activities.first['activity_type_id'] == 5
  end
end
