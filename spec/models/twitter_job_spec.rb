require 'rails_helper'

RSpec.describe TwitterJob do
  it "responds to work method" do
    expect(TwitterJob.respond_to?(:perform)).to eq(true)
  end


end
