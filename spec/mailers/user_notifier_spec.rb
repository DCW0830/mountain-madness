require "rails_helper"

RSpec.describe UserNotifier, :type => :mailer do
  describe 'new account' do
    xit 'sends an email with welcome' do
      User.new(name: 'aaron')
      email = ActionMailer::Base.deliveries.last
      puts email.inspect
      expect(email.subject).to eq('Welcome to Mountain Madness')
    end
  end
end
