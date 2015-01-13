require 'rails_helper'

Rails.describe TrailSearch do
  describe ".encoded_param" do
    it "creates a url encoded param" do
      encoded_param = TrailSearch.encoded_param('city_cont', 'denver')
      expect(encoded_param).to eq("&q[city_cont]=denver")
    end

    it "standardizes input withlower case" do
      encoded_param = TrailSearch.encoded_param('city_cont', 'Denver')
      expect(encoded_param).to eq("&q[city_cont]=denver")
    end

    it "replaces spaces with something" do
      encoded_param = TrailSearch.encoded_param('state_cont', 'Salt Lake City')
      expect(encoded_param).to eq("&q[state_cont]=salt%20lake%20city")
    end
  end


  describe ".city" do
    it "creates a url encoded param" do
      encoded_city = TrailSearch.city('denver')
      expect(encoded_city).to eq("&q[city_cont]=denver")
    end

    it "standardizes input withlower case" do
      encoded_city = TrailSearch.city('Denver')
      expect(encoded_city).to eq("&q[city_cont]=denver")
    end

    it "replaces spaces with something" do
      encoded_city = TrailSearch.city('Salt Lake City')
      expect(encoded_city).to eq("&q[city_cont]=salt%20lake%20city")
    end
  end

  describe ".state" do
    it "creates a url encoded param" do
      encoded_state = TrailSearch.state('colorado')
      expect(encoded_state).to eq("&q[state_cont]=colorado")
    end

    it "standardizes input withlower case" do
      encoded_state = TrailSearch.state('Colorado')
      expect(encoded_state).to eq("&q[state_cont]=colorado")
    end

    it "replaces spaces with something" do
      encoded_state = TrailSearch.state('South Dakota')
      expect(encoded_state).to eq("&q[state_cont]=south%20dakota")
    end
  end

end
