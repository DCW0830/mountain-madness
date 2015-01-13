require 'rails_helper'

RSpec.describe  do
  describe ".search" do
    it 'does a search' do
      allow(TrailSearch).to receive(:search).and_return('MOCKED')
      p trail = Trail.search('colorado', 'denver')
      # expect(trail).to
    end
  end

  describe ".search_by_state" do
    it 'searches by state' do
    end
  end
end
