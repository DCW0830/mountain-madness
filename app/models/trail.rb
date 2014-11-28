class Trail < ActiveRecord::Base
  include HTTParty
  require 'open-uri'
  require_dependency 'ostruct'
  # validates :unique_id, presence: true, uniqueness: true
  has_many :usertrails
  has_many :users, through: :usertrails

  def self.search(state, city)
    @response = party(build_url(state, city))
    create_objects
  end

  def self.search_state(state)
    @response = party(build_state_url(state))
    create_objects
  end

  def self.search_city(city)
    @response = party(build_city_url(city))
    create_objects.each do |trail_attributes|
      create(trail_attributes) unless find_by(unique_id: trail_attributes[:unique_id])
    end
  end

  def self.search_id(id)
    @response = party(build_unique_id_url(id))
    create_objects
  end

  def self.party(searches)
    HTTParty.get(searches)
  end

  def self.create_objects
    @response.parsed_response["places"].map do |trail|
      if trail['activities'].present? && mountain_bike_trail?(trail['activities'].first)
        {
          unique_id: trail['unique_id'],
          distance: trail['activities'].first['length'],
          description: trail['activities'].first['description'],
          name: trail['name'],
          city: trail['city'],
          state: trail['state'],
          lat: trail['lat'],
          lon: trail['lon'],
          directions: trail['directions'],
          rating: trail['activities'].first['rating'],
          url: trail['activities'].first['url'],
          thumbnail: trail['activities'].first['thumbnail']
        }
      end
    end.compact!
  end

  def self.mountain_bike_trail?(activity)
    activity['activity_type_id'] && activity['activity_type_id'] == 5
  end

  def self.url
    'https://outdoor-data-api.herokuapp.com/api.json'
  end

  def self.api_key
    '?&api_key=9a4912af55dd690f097662cdf5b21bcb'
  end

  def self.state(searched_state='')
    searched = URI::encode searched_state
    "&q[state_cont]=#{searched}"
  end

  def self.city(searched_city='')
    searched = URI::encode searched_city
    "&q[city_cont]=#{searched}"
  end

  def self.unique_id(searched_id='')
    searched = URI::encode searched_id
    "&q[unique_id_eq]=#{searched}"
  end

  def self.base
    url + api_key
  end

  def self.build_url(searched_state, searched_city)
    built = base + city(searched_city) + state(searched_state)
    built.to_s
  end

  def self.build_city_url(searched_city)
    built = base + city(searched_city)
    built.to_s
  end

  def self.build_state_url(searched_state)
    built = base + state(searched_state)
    built.to_s
  end

  def self.build_unique_id_url(searched_id)
    built = base + unique_id(searched_id)
    built.to_s
  end

  def bike_trail?
    trail.activities.first['activity_type_id'] == 5
  end
end
