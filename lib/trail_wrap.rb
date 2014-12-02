module TrailWrap
  class TrailUser
    attr_reader :id

    def initialize(id = '')
      @id = id
    end

    def url
      'http://192.241.153.158/api/v1/trails'
    end

    def build_url
      if id.empty?
        "#{url}.json"
      else
        "#{url}/#{id}.json"
      end
    end

    def make_request
      (Faraday.get(build_url))
    end
  end
end
