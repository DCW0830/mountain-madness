require 'rails_helper'

RSpec.describe User, :type => :model do
  describe 'user' do
    it 'cannot create without a name' do
      user1 = User.new(name: 'aaron')
      user2 = User.new
      expect(user1).to be_valid
      expect(user2).to_not be_valid
    end
  end
end
