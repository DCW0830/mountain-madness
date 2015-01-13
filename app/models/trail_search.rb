class TrailSearch
  def self.search
    'not mocked'
  end

  def self.city(searched_city='')
    encoded_param 'city_cont', searched_city
  end

  def self.state(searched_state='')
    encoded_param 'state_cont', searched_state
  end

  def self.encoded_param(name, value)
    encoded_value = URI::encode value.downcase
    "&q[#{name}]=#{encoded_value}"
  end
end
