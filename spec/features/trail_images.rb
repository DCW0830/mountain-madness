require 'rails_helper'

feature "Posting an image to a trail" do
  before do
    @user = User.create(name: 'joe')
    @trail = Trail.create(name: 'weema')
  end
  scenario 'from the trail page' do
    page.set_rack_session(user_id: @user.id)
    visit trail_path (@trail)
    within '#new-image' do
      fill_in 'image[name]', with: 'my greatest moment'
      click_link_or_button "Add Image"
    end
    within '#images' do
      expect(page).to have_content('my greatest moment')
    end
  end
end
