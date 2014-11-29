require 'rails_helper'

feature "Commenting on a Trail" do
  before do
    @user = User.create(name: 'joe')
    @trail = Trail.create(name: 'weema')
  end
  scenario "from the trail page" do

    page.set_rack_session(:user_id => @user.id)
    visit trail_path(@trail)
    within '#new-comment' do
      fill_in "comment[body]", with: 'that was a sic trail'
      click_link_or_button "Add Comment"
    end
    within '#comments' do
      expect(page).to have_content('that was a sic trail')
    end
  end
end

# <input type="textarea" required>
